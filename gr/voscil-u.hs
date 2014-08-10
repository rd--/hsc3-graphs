-- voscil-u (rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Random.IO {- hsc3-lang -}
import qualified Sound.SC3.UGen.Unsafe as U {- hsc3-unsafe -}

-- > Sound.SC3.UGen.Dot.draw (voscil 32)
voscil :: Real a => a -> UGen
voscil b =
  let lfn = U.lfNoise0 KR
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

run :: Transport m => m ()
run = do
  let bn = 8192 * 4
      b = 32
      r_set i =
          do m <- rrand 2 512
             j <- sequence (replicate m (rrand 0 bn))
             k <- sequence (replicate m (rrand (-1) 1))
             _ <- async (b_alloc i bn 1)
             send (b_set i (zip j k))
  mapM_ r_set [0 .. (b - 1)]
  play (out 0 (voscil b))

main :: IO ()
main = withSC3 run
