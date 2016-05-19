-- after goeyvaerts, nick collins (nc), 2007

import Control.Concurrent.MVar {- base -}
import Data.List
import Data.List.Split {- split -}
import qualified Data.Map as M {- containers -}
import Sound.OSC.FD {- hosc -}
import Sound.SC3.FD {- hsc3 -}
import Sound.SC3.Common.Buffer {- hsc3 -}
import qualified Sound.SC3.Lang.Random.Gen as R {- hsc3-lang -}
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
r_chain :: (g -> (a,g)) -> g -> [a]
r_chain f g =
    let (r,g') = f g
    in r : r_chain f g'

r_chain_fb :: ((a,g) -> (a,g)) -> a -> g -> [a]
r_chain_fb f r_ g_ =
    let go (r,g) = let (r',g') = f (r,g) in r' : go (r',g')
    in r_ : go (r_,g_)

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
l_stepper_scramble l = scrambleIO l >>= l_stepper

{-
a <- l_stepper [1..5]
sequence (replicate 10 a)
-}

type SEL a b g = (a,g) -> (b,g)

-- | a recursion schema where s chooses between a and b at each step
sel_seq :: RandomGen g => SEL a Bool g->SEL a a g->SEL a a g->a->g->[a]
sel_seq s a b j =
    let step (i,g) =
            let (r,g') = s (i,g)
            in if r then a (i,g') else b (i,g')
    in r_chain_fb step j

-- | variant where s is a (coin' c) and a is (rrand'c r)
sel_seq_c_rng :: (RandomGen g,Random a) => R -> (a,a) -> a -> g -> [a]
sel_seq_c_rng c r i g =
    let s = coin c . snd
        a = rrandc r . snd
    in sel_seq s a id i g

-- | monadic if
ifM :: Monad m => m Bool -> m b -> m b -> m b
ifM i j k = do
  i' <- i
  if i' then j else k

-- | coin at R
coin :: (RandomGen g) => R -> g -> (Bool,g)
coin = R.coin

-- | 'coin' at R
coinIO :: R -> IO Bool
coinIO = getStdRandom . coin

-- | 'R.wchoose'.
wchoose :: RandomGen g => [a] -> [R] -> g -> (a,g)
wchoose = R.wchoose

-- | wchoose at R
wchooseIO :: [a] -> [R] -> IO a
wchooseIO l= getStdRandom . wchoose l

-- | rrand with duple range
rrandc :: (RandomGen g,Random n) => (n,n) -> g -> (n,g)
rrandc = uncurry R.rrand

scrambleIO :: [t] -> IO [t]
scrambleIO = getStdRandom . R.scramble

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
                t = [0.005,rand 'α' 0.009 0.05,0.005]
                d = Envelope l t (replicate 3 EnvLin) Nothing Nothing
            in lpf (distort p) (envGen KR 1 1 0 1 DoNothing d)
        e = let l = [0,1,0.4,0.7,0]
                t = [rand 'β' 0.001 0.005,0.005,0.005,sustain]
                d = Envelope l t (replicate 4 EnvLin) Nothing Nothing
            in envGen KR 1 1 0 1 RemoveSynth d
    in out 0 (pan2 (s * e) pan 1)

fx :: UGen
fx = replaceOut 0 (freeVerb (in' 2 AR 0) 0.33 1.5 0.5)

ag_init :: Transport t => t -> IO ()
ag_init fd = do
  _ <- async fd (d_recv (synthdef "nd" nd))
  _ <- async fd (d_recv (synthdef "fx" fx))
  send fd (s_new "fx" (-1) AddToHead 1 [])
  return ()

nd_msg :: Double -> Double -> Double -> Double -> Message
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
selections_incr = M.adjust (+ 1)

selections_step' :: RandomGen g => S -> g -> (S,g)
selections_step' s g =
    let (r,g') = coin 0.03 g
    in (if r then selections' else s,g')

selections_step :: S -> IO S
selections_step s = ifM (coinIO 0.03) (return selections') (return s)

note_set :: [Int]
note_set = [0 .. 11]

note_step' :: RandomGen g => [Int] -> P -> g -> (Int,g)
note_step' n p = R.wchoose n (normalizeSum (M.elems p))

note_step :: [Int] -> P -> IO Int
note_step n = getStdRandom . note_step' n

chord_n' :: RandomGen g => g -> [Int]
chord_n' = r_chain (wchoose [1,2,3,4,5] [0.5,0.35,0.1,0.025,0.025])

chord_n :: IO [Int]
chord_n = fmap chord_n' newStdGen

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

ioi_mult_seq' :: RandomGen g => R -> g -> [R]
ioi_mult_seq' i g =
    let s = uncurry coin
        a = R.choose ioi_mult_set . snd
    in sel_seq s a id i g

--ioi_mult_seq_ = getStdRandom . ioi_mult_seq

octaves_rng :: (Int,Int)
octaves_rng = (2,5)

octaves_seq' :: RandomGen g => g -> [Int]
octaves_seq' = sel_seq_c_rng 0.02 octaves_rng 4

base_note_rng :: (Int,Int)
base_note_rng = (35,47)

base_note_seq' :: RandomGen g => g -> [Int]
base_note_seq' = sel_seq_c_rng 0.01 base_note_rng 36

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
  g <- newStdGen
  m <- l_stepper (ioi_mult_seq' 0.1 g)
  o <- l_stepper (octaves_seq' g)
  b <- l_stepper (base_note_seq' g)
  n <- scrambleIO note_set
  return AG {note_row = n
            ,amp_row = a
            ,sus_row = s
            ,pan_row = p
            ,ioi_row = i
            ,ioi_mult_seq = m
            ,base_note_seq = b
            ,octaves_seq = o
            ,selections = selections'
            ,probabilities = probabilities'}

ag_note :: S -> Int -> Int -> Int -> Int
ag_note s' z o b = ((s' M.! z) `mod` o) * 12 + b + z

-- o,b,a,su,pn,i,im are lists
-- p,s,z are nested lists
ag_psz' :: RandomGen g => [Int] -> [Int] -> P -> S -> g -> [([P],[S],[Int])]
ag_psz' nr cn p s g =
    let (n:ns) = cn
        ((p',s',c),g') = chord' p s n nr g
        p'' = probabilities_incr (last p')
        (s'',g'') = selections_step' (last s') g'
    in (p',s',c) : ag_psz' nr ns p'' s'' g''

ag_psz :: [Int] -> [Int] -> P -> S -> IO [([P], [S], [Int])]
ag_psz nr cn p s = do
  g <- newStdGen
  return (ag_psz' nr cn p s g)

{-
let g = mkStdGen 0
let cn = chord_n' g
let t3_3 (_,_,x) = x
take 12$ map t3_3$ ag_psz note_set cn probabilities' selections' g
-}

scramble_c :: [t] -> IO [t]
scramble_c x = fmap cycle (scrambleIO x)

type Score = ([([Int],[Int],[R],[R],[R],([P],[S],[Int]))],[R],[R])

ag_score :: IO Score
ag_score = do
  a <- scramble_c amp_set
  su <- scramble_c sus_set
  pn <- scramble_c pan_set
  i <- scramble_c ioi_set
  g <- newStdGen
  let m = ioi_mult_seq' 0.1 g
      o = octaves_seq' g
      b = base_note_seq' g
  nr <- scrambleIO note_set
  cn <- chord_n
  let gr = splitPlaces (map (+ 1) cn)
  psz <- ag_psz nr cn probabilities' selections'
  return (zip6 (gr o) (gr b) (gr a) (gr su) (gr pn) psz,i,m)

---ag_run_score (a,s,p,o,b,psz,i,m) =

ag_run_note :: Transport t => t->Int->Int->R->R->R->(P,S,Int)->IO()
ag_run_note fd o b a su pn (p,s,z) = do
  let mn = ag_note s z o b
  print ('γ',o,'δ',b)
  print ('ε',map (set_prec 2) (M.elems p))
  print ('ζ',M.elems s)
  send fd (nd_msg (midiCPS (fromIntegral mn)) a su pn)

ag_step :: Transport t => t -> AG -> IO AG
ag_step fd r = do
  let act (p,s,z) = do
        o <- octaves_seq r
        b <- base_note_seq r
        a <- amp_row r
        su <- sus_row r
        pn <- pan_row r
        ag_run_note fd o b a su pn (p,s,z)
  (p',s') <- do let p = probabilities_incr (probabilities r)
                s <- selections_step (selections r)
                n <- wchooseIO [1,2,3,4,5] [0.5,0.35,0.1,0.025,0.025]
                (p',s',c) <- chord p s n (note_row r)
                mapM_ act (zip3 p' s' c)
                return (last p',last s')
  dt <- ioi_row r
  i <- ioi_mult_seq r
  wait (dt * i)
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
  withSC3 (\fd -> ag_run fd (Just i) >> wait 9 >> reset fd)

{-
withSC3 ag_init
withSC3 (\fd -> send fd (nd_msg 660 0.45 0.65 0))
r <- ag
withSC3 (\fd -> ag_step fd r)
withSC3 (\fd -> ag_run fd (Just 32))
withSC3 (\fd -> ag_run fd Nothing)
withSC3 reset
-}
