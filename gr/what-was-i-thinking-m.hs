-- what was i thinking? (jmcc) #2

import Sound.SC3.Monad {- hsc3 -}

what_was_i_thinking :: UId m => m UGen
what_was_i_thinking = do
  n0 <- lfNoise1 KR 0.2
  n1 <- lfNoise1 KR 0.157
  let p = pulse AR f (n1 * 0.4 + 0.5) * 0.04
      i = lfPulse AR 0.1 0 0.05 * impulse AR 8 0 * 500
      d = decay i 2
      f = max (sinOsc KR 4 0 + 80) d
      z = rlpf p (n0 * 2000 + 2400) 0.2
      c x = do r <- rand 0 0.3
               n <- lfNoise1 KR r
               return (combL x 0.06 (n * 0.025 + 0.035) 1)
      y = z * 0.6
  z0 <- clone 2 (c y)
  z1 <- clone 2 (c y)
  return (z + mce [mix z0,mix z1])

main :: IO ()
main = audition . out 0 =<< what_was_i_thinking

