-- reverberated sine percussion (jmcc) #3
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}

reverberated_sine_percussion :: UId m => m UGen
reverberated_sine_percussion = do
  let d = 6
      c = 5
      a = 4
      s_ = do return (resonz (#(dustM AR (2 / constant d)) * 50) (200 + #(randM 0 3000)) 0.003)
      x_ i = do return (allpassN i 0.05 #(clone 2 (randM 0 0.05)) 1)
  s <- fmap sum (sequence (replicate d s_))
  y <- do let z = delayN s 0.048 0.48
          return (mix (combL z 0.1 (#(lfNoise1M KR #(clone c (randM 0 0.1))) * 0.04 + 0.05) 15))
  x <- chainM a x_ y
  return (s + x * 0.2)

main :: IO ()
main = audition . out 0 =<< reverberated_sine_percussion
