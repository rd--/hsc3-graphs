-- reverberated sine percussion (jmcc) #3

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Syntax {- hsc3 -}

reverberated_sine_percussion :: UId m => m UGen
reverberated_sine_percussion = do
  let d = 6
      c = 5
      a = 4
      s_ = do n <- dustM AR (2 / constant d)
              r <- randM 0 3000
              return (resonz (n * 50) (200 + r) 0.003)
      x_ i = do r <- clone 2 (randM 0 0.05)
                return (allpassN i 0.05 r 1)
  s <- fmap sum (sequence (replicate d s_))
  y <- do let z = delayN s 0.048 0.48
          r <- clone c (randM 0 0.1)
          n <- lfNoise1M KR r
          return (mix (combL z 0.1 (n * 0.04 + 0.05) 15))
  x <- chainM a x_ y
  return (s + x * 0.2)

main :: IO ()
main = audition . out 0 =<< reverberated_sine_percussion
