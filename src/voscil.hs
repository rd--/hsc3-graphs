-- voscil (rd)

import Sound.OpenSoundControl {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Unsafe {- hsc3-unsafe -}
import System.Random {- random -}

voscil :: Real a => a -> UGen
voscil b =
  let lfn r = lfNoise0 KR r
      hb = (constant b - 1) / 2
      rt = 6
      f = 600
      v = vOsc AR (lfn rt * hb + hb) (f * 2) 0
      o = let bf = lfn rt * 40 + 600
              nh = lfn rt * 16 + 24
          in blip AR bf nh * (lfn rt * 0.1 + 0.1)
      p = pan2 (v + o) (lfn rt) (lfn rt * 0.5 + 0.5)
      w = vOsc AR (lfSaw KR (1 / rt) 0 * hb + hb) f 0
      q = pan2 w (lfn rt) (lfn rt * 0.5 + 0.5)
  in p + q

run :: Transport t => t -> IO ()
run fd = do
  let rrand l r = getStdRandom (randomR (l,r))
      bn = 8192 * 4
      b = 32
      r_set i =
          do m <- rrand 2 512
             j <- sequence (replicate m (rrand 0 bn))
             k <- sequence (replicate m (rrand (-1) 1))
             _ <- async fd (b_alloc i bn 1)
             send fd (b_set i (zip j k))
  mapM_ r_set [0 .. (b - 1)]
  play fd (out 0 (voscil b))

main :: IO ()
main = withSC3 run
