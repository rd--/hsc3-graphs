-- s-chirp (rd)

import Sound.OSC
import Sound.SC3.ID

s_chirp :: UGen
s_chirp =
  let x = mouseX KR 15 0 Linear 0.1
      y = mouseY KR 15 27 Linear 0.1
      t = dust 'a' KR 9
      b = tChoose 'a' t (mce [36,48,60,72])
      n = lfNoise1 'a' KR (mce2 3 3.05) * 0.04
      d = tIRand 'a' x y t
      e = decay2 t 0.005 (tRand 'a' 0.02 0.15 t)
      o = let k = degreeToKey 0 d 12
              f = midiCPS (b + k + n)
              m = e * sinOsc AR f 0 * 0.2
              u = pulseDivider t 9 0
              r0 = tRand 'a' 0.0075 0.125 u
              r1 = tRand 'a' 0.05 0.15 u
          in m * 0.5 + allpassC m 0.15 r0 r1
  in out 0 o

act :: Transport m => m ()
act = do
  let scl = [0,2,3.2,5,7,9,10]
  _ <- async (b_alloc_setn1 0 0 scl)
  play s_chirp

main :: IO ()
main = withSC3 act
