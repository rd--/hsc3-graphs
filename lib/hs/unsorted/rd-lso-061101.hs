-- | L-System oscillator (rd, 2006-11-01)

import Control.Monad {- base -}
import System.Directory {- directory -}
import qualified System.FilePath as P {- filepath -}

import Data.CG.Minus.Types {- hps -}
import qualified LSystem.LSystem as L {- hls -}
import qualified LSystem.Systems as L {- hls -}
import qualified LSystem.Turtle as L {- hls -}

import qualified Sound.File.NeXT as F {- hsc3-sf -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Random.IO as R {- hsc3-lang -}

-- | Normalise to lie in (0,1).
--
-- > normalise [1,4,2,5] == [0.2,0.8,0.4,1]
normalise :: (Fractional a,Ord a) => [a] -> [a]
normalise s =
    let n = 1 / maximum (map abs s)
    in map (* n) s

-- | 'L.render' rule.
plain :: [Double] -> Pt Double -> Pt Double -> [Double]
plain d (Pt x0 y0) (Pt x1 y1) = [x0,y0,x1,y1] ++ d

-- | Render 'L.LSystem' to 'plain' data.
lsys_run :: (L.LSystem,Double,Double) -> Int -> [Double]
lsys_run (l,ta,lls) i =
    let a = L.Turtle ta (Pt 0 0) (pi/2) 1 lls []
    in L.render [] plain (L.expand l i) a

-- | 'normalise' '.' 'lsys_run'
--
-- > length (gen_d L.l0d 3)
gen_d :: (L.LSystem,Double,Double) -> Int -> [Double]
gen_d l = normalise . lsys_run l

-- | Write 'gen_d' to 'FilePath' as /NeXT/ sound file.
gen_f :: FilePath -> [Double] -> IO ()
gen_f nm d = F.au_write nm (F.SF_Header (length d) F.Float 44100 1) [d]

-- | Rendered L-system data sets.
lsys_data :: [[Double]]
lsys_data =
    [gen_d L.l0d 3
    ,gen_d L.l1d 3
    ,gen_d L.l2d 5
    ,gen_d L.l3d 12
    ,gen_d L.l4d 6
    ,gen_d L.l5d 4
    ,gen_d L.l6d 7
    ,gen_d L.l7d 4
    ,gen_d L.l8d 6
    ,gen_d L.l9d 10
    ,gen_d L.lAd 11
    ,gen_d L.lBd 6
    ,gen_d L.lCd 5]

{-
-- | Exceeds UDP limits.
lsys_send :: IO ()
lsys_send = do
  let alloc (n,d) = async (b_alloc_setn1 n 0 d)
  withSC3 (mapM_ alloc (zip [0..] lsys_data))
-}

-- | Filename for 'lsys_data'.
lsys_fn :: FilePath  -> [FilePath]
lsys_fn d =
    let n = length lsys_data
        nm i = d P.</> show i P.<.> "snd"
    in map nm [0 .. n - 1]

-- | Write 'lsys_data' to 'lsys_fn' using 'gen_f'.
lsys_write :: FilePath -> IO ()
lsys_write d = zipWithM_ gen_f (lsys_fn d) lsys_data

-- | Load 'lsys_fn' at /scsynth/.
lsys_load :: FilePath -> IO ()
lsys_load d = do
  let alloc (n,nm) = async (b_allocRead n nm 0 0)
  withSC3 (mapM_ alloc (zip [0..] (lsys_fn d)))

-- | Oscillator instrument
oi :: IO UGen
oi = do
  c <- R.choose [0.25, 0.55, 0.75, 1.25]
  let t = impulse KR c 0
  b <- tiRandM 0 12 t
  let n  = bufFrames KR b
      m  = n / 4
      i  = floorE (linLin_b (lfSaw AR c 0) 0 m) * 4
      tt = impulse AR (m / c) 0
      x0 = bufRdL 1 AR b i       NoLoop
      y0 = bufRdL 1 AR b (i + 1) NoLoop
      x1 = bufRdL 1 AR b (i + 2) NoLoop
      y1 = bufRdL 1 AR b (i + 3) NoLoop
  f0 <- R.choose [16, 32, 64, 128, 256, 512, 8192]
  let f1 = 22000
      o x y = let f = linExp_b x f0 f1
              in pan2 (blip AR f (linLin_b y 1 64)) y0 (decay tt 0.005)
  return (o x0 y0 + o x1 y1)

main :: IO ()
main = do
  t <- getTemporaryDirectory
  lsys_write t
  lsys_load t
  oi >>= audition . out 0
