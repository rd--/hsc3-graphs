-- birds (jmcc)
-- http://lists.create.ucsb.edu/pipermail/sc-users/2007-April/033239.html
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3.Monad {- hsc3 -}

node :: UId m => m UGen
node = do
  let f = lag (lfSaw AR (7 + #(rand (-1.5) 1.5)) #(rand 0 1) * #(rand 11 15)) 0.1 + #(rand 94 102)
  let a = lfPulse KR (1 / #(rand 12 15.6)) #(rand 0 1) 0.16 * 0.05
  let b = sinOsc AR (midiCPS f) #(rand 0 1) * a
  return (rotate2 b (silent 1) #(rand (-1) 1))

birds :: UId m => m UGen
birds = do
  d <- return . sum =<< sequence (replicate 6 node)
  let apf i = do return (allpassL i 0.07 #(rand 0 0.06) #(rand 0.7 2.0))
  w <- chainM 12 apf d
  return (d * 0.7 + w * 0.3)

main :: IO ()
main = audition . out 0 =<< birds
