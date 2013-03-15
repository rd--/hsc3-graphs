{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}
-- reverberated sine percussion (jmcc)

import Sound.SC3.Monad {- hsc3 -}

reverberated_sine_percussion :: (Functor m,UId m) => m UGen
reverberated_sine_percussion = do
  let d = 6
      c = 5
      a = 4
      s_ = do return (resonz (#(dust AR (2 / constant d)) * 50) (200 + #(rand 0 3000)) 0.003)
      x_ i = do return (allpassN i 0.05 #(clone 2 (rand 0 0.05)) 1)
  s <- fmap sum (sequence (replicate d s_))
  y <- do let z = delayN s 0.048 0.48
          return (mix (combL z 0.1 (#(lfNoise1 KR #(clone c (rand 0 0.1))) * 0.04 + 0.05) 15))
  x <- chainM a x_ y
  return (s + x * 0.2)

main :: IO ()
main = audition . out 0 =<< reverberated_sine_percussion
