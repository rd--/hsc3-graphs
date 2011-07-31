-- after goeyvaerts, nick collins 2007

import Data.IORef
import qualified Data.Map as M {- containers -}
import Sound.OpenSoundControl {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import qualified Sound.SC3.Lang.Collection.SequenceableCollection as L
import qualified Sound.SC3.Lang.Math.SimpleNumber as L {- hsc3-lang -}
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
l_step :: IORef [a] -> IO a
l_step r =
    let f [] = undefined
        f (x:xs) = (x,xs)
    in ioref_st r f

l_stepper :: [a] -> IO (IO a)
l_stepper l = do
  r <- newIORef (cycle l)
  return (l_step r)

{-
a <- l_stepper [1..5]
sequence (replicate 10 a)
-}

type R = Double
data AG = AG {note_row :: [Int]
             ,amp_row :: IO R
             ,sus_row :: IO R
             ,pan_row :: IO R
             ,ioi_row :: IO R
             ,ioi_mult_seq :: IO R
             ,base_note_seq :: IO Int
             ,octaves_seq :: IO Int
             ,selections :: M.Map Int Int
             ,probabilites :: M.Map Int R}

selections' :: M.Map Int Int
selections' = M.fromList (map (\i -> (i,0)) [0..11])

note_row' :: Enum e => e -> [Int]
note_row' e = L.scramble' e [0 .. 11]

amp_row' :: Enum e => e -> [R]
amp_row' e = L.scramble' e (map (dbAmp . negate) [1,3 .. 36])

sus_row' :: Enum e => e -> [R]
sus_row' e = L.scramble' e (map ((/ exp 1) . exp . (/ 37)) [1 .. 37])

pan_row' :: Enum e => e -> [R]
pan_row' e = L.scramble' e (map ((+ (-1)) . (* 2) . (/ 31)) [1 .. 31])

ioi_row' :: Enum e => e -> [R]
ioi_row' e = map (12 **) (L.scramble' e (map (/ 12) [1..12]))

type SEL a b = (a,StdGen) -> (b,StdGen)

mk_sel_seq :: Enum e => e -> SEL a Bool -> SEL a a -> SEL a a -> a -> [a]
mk_sel_seq e s a b j =
    let step i g =
            let (r,g') = s (i,g)
            in if r then a (i,g') else b (i,g')
    in j : r_chain (mkStdGen (fromEnum e)) (step j)

ioi_mult_seq' :: Enum e => e -> R -> [R]
ioi_mult_seq' e =
    let s = uncurry L.coin'
        a = L.choose' [0.01,0.025,0.05,0.1,0.2] . snd
    in mk_sel_seq e s a id

octaves_seq' :: Enum e => e -> [Int]
octaves_seq' e =
    let s = coin' 0.02 . snd
        a = L.rrand' 2 5 . snd
    in mk_sel_seq e s a id 4

base_note_seq' :: Enum e => e -> [Int]
base_note_seq' e =
    let s = coin' 0.01 . snd
        a = L.rrand' 35 47 . snd
    in mk_sel_seq e s a id 36

probabilites' :: M.Map Int R
probabilites' = M.fromList (map (\x -> (x,1)) [0..11])

ag :: IO AG
ag = do
  a <- l_stepper (amp_row' 'a')
  s <- l_stepper (sus_row' 'b')
  p <- l_stepper (pan_row' 'c')
  i <- l_stepper (ioi_row' 'd')
  m <- l_stepper (ioi_mult_seq' 'e' 0.1)
  o <- l_stepper (octaves_seq' 'f')
  b <- l_stepper (base_note_seq' 'g')
  return (AG {note_row = note_row' 'i'
             ,amp_row = a
             ,sus_row = s
             ,pan_row = p
             ,ioi_row = i
             ,ioi_mult_seq = m
             ,base_note_seq = b
             ,octaves_seq = o
             ,selections = selections'
             ,probabilites = probabilites' })

ifM :: Monad m => m Bool -> m b -> m b -> m b
ifM i j k = do
  i' <- i
  if i' then j else k

coin :: R -> IO Bool
coin = L.coin

coin' :: (RandomGen g) => R -> g -> (Bool,g)
coin' = L.coin'

wchoose :: [a] -> [R] -> IO a
wchoose = L.wchoose

mrec :: Monad m => (a -> m a) -> a -> m a
mrec f i = do
  j <- f i
  mrec f j

mrec_n :: Monad m => Int -> (a -> m a) -> a -> m a
mrec_n n f i =
    if n == 0
    then return i
    else do j <- f i
            mrec_n (n - 1) f j

ag_note :: M.Map Int Int -> Int -> Int -> Int -> Int
ag_note s' z o b = ((s' M.! z) `mod` o) * 12 + b + z

r_chain :: t -> (t -> (a,t)) -> [a]
r_chain g f =
    let (r,g') = f g
    in r : r_chain g' f

ag_step :: Transport t => t -> AG -> IO AG
ag_step fd r = do
  let act (p',s') = do
        z <- wchoose (note_row r) (L.normalizeSum (map snd (M.toList p')))
        o <- octaves_seq r
        b <- base_note_seq r
        let mn = ag_note s' z o b
            mn' = fromIntegral mn
        a <- amp_row r
        su <- sus_row r
        pn <- pan_row r
        send fd (nd_msg (midiCPS mn') a su pn)
        return (M.insert z 0.1 p',M.adjust (+ 1) z s')
      p = M.map (\x -> if x < 0.9999 then x + 0.1 else x) (probabilites r)
  s <- ifM (coin 0.03) (return selections') (return (selections r))
  n <- wchoose [1,2,3,4,5] [0.5,0.35,0.1,0.025,0.025]
  (p',s') <- mrec_n n act (p,s)
  dt <- ioi_row r
  i <- ioi_mult_seq r
  pauseThread (dt * i)
  return (r {probabilites = p',selections = s'})

ag_run :: Transport t => t -> Maybe Int -> IO ()
ag_run fd i = do
  r <- ag
  ag_init fd
  _ <- case i of
         Just n -> mrec_n n (ag_step fd) r
         Nothing -> mrec (ag_step fd) r
  return ()

main :: IO ()
main = do
  i <- randomRIO (256,512)
  withSC3 (\fd -> ag_run fd (Just i) >> pauseThread 9 >> reset fd)

{-
withSC3 ag_init
withSC3 (\fd -> send fd (nd_msg 660 0.45 0.65 0))
r <- ag
withSC3 (\fd -> ag_step fd r)
withSC3 (\fd -> ag_run fd (Just 32))
withSC3 (\fd -> ag_run fd Nothing)
withSC3 reset
-}
