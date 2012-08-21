-- shifting pulses (rd)

import Sound.SC3.Monad {- hsc3 -}

-- > Sound.SC3.UGen.Dot.draw =<< shifting_pulses
shifting_pulses :: UId m => m UGen
shifting_pulses = do
  n0 <- clone 2 (brownNoise KR)
  n1 <- clone 2 (brownNoise KR)
  n2 <- clone 2 (brownNoise KR)
  t <- dust KR 0.75
  let warp i = linLin i (-1) 1
      l = latch t t
      p = pulse AR (warp n0 2 (mce2 11 15)) 0.01 * 0.1
      f = warp n1 300 1800
      rq = warp n2 0.01 2
  return (l * rlpf p f rq)

main :: IO ()
main = audition . out 0 =<< shifting_pulses
