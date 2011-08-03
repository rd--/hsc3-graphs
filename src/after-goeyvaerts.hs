-- after goeyvaerts, nick collins, 2007

import Control.Concurrent.MVar
import qualified Data.Map as M {- containers -}
import Sound.OpenSoundControl {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import qualified Sound.SC3.Lang.Collection.SequenceableCollection as L
import qualified Sound.SC3.Lang.Math.SimpleNumber as L {- hsc3-lang -}
import System.Random {- random -}

-- * SCHEMA

-- | infinite monadic recursion
mrec :: Monad m => (a -> m a) -> a -> m a
mrec f i = f i >>= mrec f

-- | monadic recursion with counter
mrec_n :: Monad m => Int -> (a -> m a) -> a -> m a
mrec_n n f i =
    if n == 0
    then return i
    else f i >>= mrec_n (n - 1) f

-- | recursion function useful for random processes (g = random state)
r_chain :: g -> (g -> (a,g)) -> [a]
r_chain g f =
    let (r,g') = f g
    in r : r_chain g' f

-- | an action that steps through a stored sequence
l_step :: MVar [a] -> IO a
l_step r =
    let f [] = undefined
        f (x:xs) = (xs,x)
    in modifyMVar r (return . f)

-- | generate a stepper action from a list
l_stepper :: [a] -> IO (IO a)
l_stepper l = do
  r <- newMVar (cycle l)
  return (l_step r)

l_stepper_scramble :: [a] -> IO (IO a)
l_stepper_scramble l = L.scramble l >>= l_stepper

{-
a <- l_stepper [1..5]
sequence (replicate 10 a)
-}

type SEL a b = (a,StdGen) -> (b,StdGen)

-- | a recursion schema where s chooses between a and b at each step
mk_sel_seq :: Enum e => e -> SEL a Bool -> SEL a a -> SEL a a -> a -> [a]
mk_sel_seq e s a b j =
    let step i g =
            let (r,g') = s (i,g)
            in if r then a (i,g') else b (i,g')
    in j : r_chain (mkStdGen (fromEnum e)) (step j)

-- | variant where s is a (coin' c) and a is (rrand'c r)
mk_sel_seq_c_rng :: (Enum e,Random a) => e -> R -> (a,a) -> a -> [a]
mk_sel_seq_c_rng e c r i =
    let s = coin' c . snd
        a = rrand'c r . snd
    in mk_sel_seq e s a id i

-- | monadic if
ifM :: Monad m => m Bool -> m b -> m b -> m b
ifM i j k = do
  i' <- i
  if i' then j else k

-- | coin at R
coin :: R -> IO Bool
coin = L.coin

-- | coin' at R
coin' :: (RandomGen g) => R -> g -> (Bool,g)
coin' = L.coin'

-- | wchoose at R
wchoose :: [a] -> [R] -> IO a
wchoose = L.wchoose

-- | rrand' with duple range
rrand'c :: (RandomGen g,Random n) => (n,n) -> g -> (n,g)
rrand'c = uncurry L.rrand'

-- | set precision
set_prec :: Int -> Double -> Double
set_prec n x =
    let n' = 10 ^ n
        x' = round (x * n') :: Integer
    in fromIntegral x' / n'

-- * AFTER GOEYVAERTS

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

type R = Double
type P = M.Map Int R
type S = M.Map Int Int
data AG = AG {note_row :: [Int]
             ,amp_row :: IO R
             ,sus_row :: IO R
             ,pan_row :: IO R
             ,ioi_row :: IO R
             ,ioi_mult_seq :: IO R
             ,base_note_seq :: IO Int
             ,octaves_seq :: IO Int
             ,selections :: S
             ,probabilities :: P}

selections' :: S
selections' = M.fromList (map (\i -> (i,0)) [0..11])

selections_incr :: Int -> S -> S
selections_incr z = M.adjust (+ 1) z

selections_step :: S -> IO S
selections_step s = ifM (coin 0.03) (return selections') (return s)

note_set :: [Int]
note_set = [0 .. 11]

note_step' :: RandomGen g => [Int] -> P -> g -> (Int,g)
note_step' n p = L.wchoose' n (L.normalizeSum (M.elems p))

note_step :: [Int] -> P -> IO Int
note_step n = getStdRandom . note_step' n

chord' :: RandomGen g => P -> S -> Int -> [Int] -> g -> (([P],[S],[Int]),g)
chord' p_ s_ =
    let go (pl,sl,zl) p s n nr g =
            if n == 0
            then ((reverse pl,reverse sl,reverse zl),g)
            else let (z,g') = note_step' nr p g
                     p' = probabilities_decr z p
                     s' = selections_incr z s
                 in go (p':pl,s':sl,z:zl) p' s' (n - 1) nr g'
    in go ([p_],[s_],[]) p_ s_

chord :: P -> S -> Int -> [Int] -> IO ([P],[S],[Int])
chord p s n = getStdRandom . chord' p s n

amp_set :: [R]
amp_set = map (dbAmp . negate) [1,3 .. 36]

sus_set :: [R]
sus_set = map ((/ exp 1) . exp . (/ 37)) [1 .. 37]

pan_set :: [R]
pan_set = map ((+ (-1)) . (* 2) . (/ 31)) [1 .. 31]

ioi_set :: [R]
ioi_set = map ((12 **) . (/ 12)) [1..12]

ioi_mult_set :: [R]
ioi_mult_set = [0.01,0.025,0.05,0.1,0.2]

ioi_mult_seq' :: Enum e => e -> R -> [R]
ioi_mult_seq' e =
    let s = uncurry L.coin'
        a = L.choose' ioi_mult_set . snd
    in mk_sel_seq e s a id

octaves_rng :: (Int,Int)
octaves_rng = (2,5)

octaves_seq' :: Enum e => e -> [Int]
octaves_seq' e = mk_sel_seq_c_rng e 0.02 octaves_rng 4

base_note_rng :: (Int,Int)
base_note_rng = (35,47)

base_note_seq' :: Enum e => e -> [Int]
base_note_seq' e = mk_sel_seq_c_rng e 0.01 base_note_rng 36

probabilities' :: P
probabilities' = M.fromList (map (\x -> (x,1)) [0..11])

probabilities_incr :: P -> P
probabilities_incr = M.map (\x -> if x < 0.9999 then x + 0.1 else x)

probabilities_decr :: Int -> P -> P
probabilities_decr z = M.insert z 0.1

ag :: IO AG
ag = do
  a <- l_stepper_scramble amp_set
  s <- l_stepper_scramble sus_set
  p <- l_stepper_scramble pan_set
  i <- l_stepper_scramble ioi_set
  m <- l_stepper (ioi_mult_seq' 'e' 0.1)
  o <- l_stepper (octaves_seq' 'f')
  b <- l_stepper (base_note_seq' 'g')
  n <- L.scramble note_set
  return (AG {note_row = n
             ,amp_row = a
             ,sus_row = s
             ,pan_row = p
             ,ioi_row = i
             ,ioi_mult_seq = m
             ,base_note_seq = b
             ,octaves_seq = o
             ,selections = selections'
             ,probabilities = probabilities'})

ag_note :: S -> Int -> Int -> Int -> Int
ag_note s' z o b = ((s' M.! z) `mod` o) * 12 + b + z

ag_step :: Transport t => t -> AG -> IO AG
ag_step fd r = do
  let act (p,s,z) = do
        o <- octaves_seq r
        b <- base_note_seq r
        let mn = ag_note s z o b
        a <- amp_row r
        su <- sus_row r
        pn <- pan_row r
        print ('p',map (set_prec 2) (M.elems p))
        print ('s',M.elems s)
        send fd (nd_msg (midiCPS (fromIntegral mn)) a su pn)
  (p',s') <- do let p = probabilities_incr (probabilities r)
                s <- selections_step (selections r)
                n <- wchoose [1,2,3,4,5] [0.5,0.35,0.1,0.025,0.025]
                (p',s',c) <- chord p s n (note_row r)
                mapM_ act (zip3 p' s' c)
                return (last p',last s')
  dt <- ioi_row r
  i <- ioi_mult_seq r
  pauseThread (dt * i)
  return (r {probabilities = p',selections = s'})

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
