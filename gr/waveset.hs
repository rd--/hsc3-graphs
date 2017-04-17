-- A simple waveset synthesiser (adc)
{-# OPTIONS_GHC -F -pgmF hsc3-uparam #-}

import qualified Data.Array as A {- array -}
import Data.List {- base -}
import qualified Sound.File.NeXT as F {- hsc3-sf -}
import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import System.Environment {- base -}
import System.Random {- random -}

-- * Waveset analysis

-- | Zero-crossing predicate.
is_zc :: (Num a, Ord a) => a -> a -> Bool
is_zc a b = a <= 0 && b > 0

-- | Locate fractional zero-crossing point.
locate_fzc :: Fractional a => a -> a -> a
locate_fzc x y = (1.0 / (y - x)) * abs x

-- | Fractional zero-crossing constructor, n is the initial frame location.
--
-- > fzc 0 [-1,1,-1,3] == [0.5,2.25]
fzc :: (Ord a, Fractional a) => a -> [a] -> [a]
fzc n =
    let rec k s = case s of
                    x:y:s' -> if is_zc x y
                              then (k + locate_fzc x y) : rec (k + 2.0) s'
                              else rec (k + 1.0) (y : s')
                    _ -> []
    in rec n

-- | Remove zero crossings so that no waveset has length less than m.
prune :: (Ord a, Num a) => a -> [a] -> [a]
prune m =
    let rec n zc =
            case zc of
              [] -> [n]
              x:zc' -> if (x - n) < m
                       then rec n zc'
                       else x : rec x zc'
    in rec 0

-- | Zero crossings to waveset bounds.
--
-- zc_to_ws [1,7,15] == [(1,7),(7,15)]
zc_to_ws :: [a] -> [(a,a)]
zc_to_ws =
    let rec zc =
            case zc of
              x:y:zc' -> (x,y) : rec (y : zc')
              _ -> []
    in rec

-- * Waveset instrument

-- | A trivial waveset instrument with unit envelope.
waveset :: UGen
waveset =
    let uparam = {bus=0,bufnum=0,start=0,end=0,rate=1,sustain=1,amp=0.2}
        rs = bufRateScale KR bufnum * rate
        ph = phasor AR 0 rs 0 (end - start) 0 + start -- see adc for rationale
        e_data = Envelope [amp, amp, 0] [sustain, 0] [EnvLin] Nothing Nothing
        e_ugen = envGen AR 1 1 0 1 RemoveSynth e_data
    in offsetOut bus (bufRdL 1 AR bufnum ph Loop * e_ugen)

-- * Waveset synthesizer

-- | Construct s_new message for synthesiser.
mk_msg :: Double -> Double -> Double -> Double -> Message
mk_msg b sf ef d =
    let a = [("bufnum", b), ("start", sf), ("end", ef), ("sustain", d)]
    in s_new "waveset" (-1) AddToTail 1 a

-- | Compare wavesets by duration.
dur_ord :: (Num t, Ord t) => (t, t) -> (t, t) -> Ordering
dur_ord (s0, e0) (s1, e1) = compare (e0 - s0) (e1 - s1)

-- | Generate score from waveset data.
mk_score :: Double -> [Double] -> [(Double, Double)] -> [Bundle]
mk_score sr repeats w =
    let durations = zipWith (\(s, e) r -> (e - s) * r / sr) w repeats
        start_times = scanl (+) 0 durations
        mk_elem (s,e) t d = Bundle t [mk_msg 10 s e d]
    in zipWith3 mk_elem w start_times durations

-- | n randomly chosen elements of w.
rchoose :: Int -> [a] -> [a]
rchoose n w =
    let (l, r) = (1, length w)
        a = A.listArray (l,r) w
    in take n (map (a A.!) (randomRs (l,r) (mkStdGen 1)))

-- | Load waveset instrument, allocate sound file buffer, do waveset
--   analysis, generate & play scores.
--
-- > withSC3 (run_waveset 64 "/home/rohan/data/audio/pf-c5.snd")
run_waveset :: Transport m => Double -> String -> m ()
run_waveset pr fn = do
  _ <- async (d_recv (synthdef "waveset" waveset))
  _ <- async (b_allocRead 10 fn 0 0)
  (hdr, cs) <- liftIO (F.au_read fn)
  let nc = F.channelCount hdr
      nf = F.frameCount hdr
      sr = fromIntegral (F.sampleRate hdr)
      b = cs !! 0
      w = zc_to_ws (prune pr (fzc 0 b))
      pl s = play (NRT s) >> wait 1
      post = liftIO . putStrLn
  post ("#f: " ++ show (nc, nf, sr))
  post ("#w: " ++ show (length w)) -- force w
  pl (mk_score sr (repeat 1) w)
  pl (mk_score sr (repeat 2) (reverse w))
  pl (mk_score sr (cycle [2,4,8]) (sortBy dur_ord w))
  pl (mk_score sr (randomRs (1,24) (mkStdGen 2)) (rchoose 512 w))
  return ()

main :: IO ()
main = do
  a <- getArgs
  case a of
    [fn] -> withSC3 (run_waveset 64 fn)
    _ -> error "audio file?"

{-
-- * Score model

-- | Interval to schedule in advance.
latency :: Double
latency = 0.15

-- | Add t to timestamp.
offset :: Time -> Bundle -> Bundle
offset t (Bundle t0 m) = Bundle (t + t0) m

-- | Play non-empty set of osc bundles.
play_set :: Transport m => [Bundle] -> m ()
play_set [] = error "play_set:empty"
play_set (x:xs) = do
  let (Bundle t _) = x
  pauseThreadUntil (t - latency)
  mapM_ sendBundle (x:xs)

-- | Play grouped score.
play_sets :: Transport m => [[Bundle]] -> m ()
play_sets [] = return ()
play_sets s = do
  t <- time
  mapM_ (play_set . map (offset t)) s

-- | Split l into chunks of at most n elements.
form_sets :: Int -> [a] -> [[a]]
form_sets _ [] = []
form_sets n l =
    let (a,b) = splitAt n l
    in a : form_sets n b

-- | Play score, send in sets on indicated cardinality.
play_score :: Transport m => Int -> [Bundle] -> m ()
play_score n s = play_sets (form_sets n s)
-}
