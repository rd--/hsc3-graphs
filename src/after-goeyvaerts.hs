-- after goeyvaerts, nick collins 2007

import Data.IORef
import qualified Data.Map as M
import qualified Foreign.C.Math.Double as C {- cmath -}
import Sound.OpenSoundControl {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import qualified Sound.SC3.Lang.Collection.SequenceableCollection as L {- hsc3-lang -}
import qualified Sound.SC3.Lang.Math.SimpleNumber as L
import System.Random {- random -}

nd :: UGen
nd =
    let freq = control KR "freq" 440
        amp = control KR "amp" 0.1
        sustain = control KR "sustain" 0.1
        pan = control KR "pan" 0
        s = let p = mix (lfPar AR (freq * mce [0.999,1.001]) 0 * amp)
                l = [10000,2000,4000,1000]
                t = [0.005,rand 'a' 0.009 0.05,0.005]
                d = env l t (replicate 3 EnvLin) 0 0
            in lpf (distort p) (envGen KR 1 1 0 1 DoNothing d)
        e = let l = [0,1,0.4,0.7,0]
                t = [rand 'b' 0.001 0.005,0.005,0.005,sustain]
                d = env l t (replicate 4 EnvLin) 0 0
            in envGen KR 1 1 0 1 RemoveSynth d
    in out 0 (pan2 (s * e) pan 1)

fx :: UGen
fx = replaceOut 0 (freeVerb (in' 2 AR 0) 0.33 1.5 0.5)

ag_init :: Transport t => t -> IO ()
ag_init fd = do
  _ <- async fd (Bundle immediately [d_recv (synthdef "nd" nd)
                                    ,d_recv (synthdef "fx" fx)])
  send fd (s_new "fx" (-1) AddToHead 1 [])
  return ()

nd_msg :: Double -> Double -> Double -> Double -> OSC
nd_msg f a s p =
    let nd_arg = [("freq",f),("amp",a),("sustain",s),("pan",p)]
    in s_new "nd" (-1) AddToHead 1 nd_arg

ioref_st :: IORef a -> (a -> (b, a)) -> IO b
ioref_st r f = do
  e <- readIORef r
  let (i,j) = f e
  writeIORef r j
  return i

-- an action that steps through a sequence
row_st :: IORef [a] -> IO a
row_st r =
    let f [] = undefined
        f (x:xs) = (x,xs)
    in ioref_st r f

{-
r <- newIORef (cycle [1..5])
ioref_st r (\(x:xs) -> (x,xs))
row_st r
-}

type R = Double
data AG = AG {degree :: Int
             ,note_row :: [Int]
             ,amp_row :: IORef [R]
             ,sus_row :: IORef [R]
             ,pan_row :: IORef [R]
             ,ioi_row :: IORef [R]
             ,ioi_mult :: R
             ,base_note :: Int
             ,octaves :: Int
             ,selections :: M.Map Int Int
             ,probabilites :: M.Map Int R}

init_selections :: (Ord k, Num k, Num a, Enum k) => k -> M.Map k a
init_selections n = M.fromList (map (\i -> (i,0)) [0..n-1])

ag :: Int -> IO AG
ag n = do
  let n' = fromIntegral n
      mk = newIORef . cycle
  a <- mk (L.scramble' 'b' (map (dbAmp . negate) [1,3 .. 36]))
  s <- mk (L.scramble' 'c' (map ((/ exp 1) . exp . (/ 37)) [1 .. 37]))
  p <- mk (L.scramble' 'd' (map ((+ (-1)) . (* 2) . (/ 31)) [1 .. 31]))
  i <- mk (map (n' **) (L.scramble' 'e' (map (/ n') [1..n'])))
  return (AG {degree = n
             ,note_row = L.scramble' 'a' [0 .. n - 1]
             ,amp_row = a
             ,sus_row = s
             ,pan_row = p
             ,ioi_row = i
             ,ioi_mult = 0.1
             ,base_note = 36
             ,octaves = 4
             ,selections = init_selections n
             ,probabilites = M.fromList (map (\x -> (x,1)) [0..n-1]) })

ifM :: Monad m => m Bool -> m b -> m b -> m b
ifM i j k = do
  i' <- i
  if i' then j else k

coin :: R -> IO Bool
coin = L.coin

wchoose :: [a] -> [R] -> IO a
wchoose = L.wchoose

fmod :: Int -> Int -> R
fmod i j = fromIntegral i `C.fmod` fromIntegral j

mrec :: Monad m => Int -> (a -> m a) -> a -> m a
mrec n f i =
    if n == 0
    then return i
    else do j <- f i
            mrec (n - 1) f j

ag_note :: M.Map Int Int -> Int -> AG -> Int -> Int
ag_note s' z r b = ((s' M.! z) `mod` octaves r) * 12 + b + z

ag_step :: Transport t => t -> AG -> IO AG
ag_step fd r = do
  i <- ifM (coin (ioi_mult r)) (L.choose [0.01,0.025,0.05,0.1,0.2]) (return (ioi_mult r))
  s <- ifM (coin 0.03) (return (init_selections (degree r))) (return (selections r))
  o <- ifM (coin 0.02) (L.rrand 2 5) (return (octaves r))
  b <- ifM (coin 0.01) (L.rrand 35 47) (return (base_note r))
  let p = M.map (\x -> if x < 0.9999 then x + 0.1 else x) (probabilites r)
  n <- wchoose [1,2,3,4,5] [0.5,0.35,0.1,0.025,0.025]
  let act (p',s') = do
        z <- wchoose (note_row r) (L.normalizeSum (map snd (M.toList p')))
        let mn = ag_note s' z r b
            mn' = fromIntegral mn
        a <- row_st (amp_row r)
        su <- row_st (sus_row r)
        pn <- row_st (pan_row r)
        send fd (nd_msg (midiCPS mn') a su pn)
        return (M.insert z 0.1 p',M.adjust (+ 1) z s')
  (p',s') <- mrec n act (p,s)
  dt <- row_st (ioi_row r)
  pauseThread (dt * i)
  return (r {ioi_mult = i
            ,selections = s'
            ,octaves = o
            ,base_note = b
            ,probabilites = p'})

ag_run :: Transport t => t -> Int -> Int -> IO ()
ag_run fd n i = do
  r <- ag n
  ag_init fd
  _ <- mrec i (ag_step fd) r
  return ()

main :: IO ()
main = do
  i <- randomRIO (256,512)
  withSC3 (\fd -> ag_run fd 12 i >> pauseThread 5 >> reset fd)

{-
withSC3 ag_init
withSC3 (\fd -> send fd (nd_msg 660 0.45 0.65 0))
r <- ag 12
withSC3 (\fd -> ag_step fd r)
withSC3 (\fd -> ag_run fd 12 32)
-}
