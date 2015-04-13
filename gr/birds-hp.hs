-- birds (jmcc)
-- http://lists.create.ucsb.edu/pipermail/sc-users/2007-April/033239.html
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Syntax {- hsc3 -}

node :: UId m => m UGen
node = do
  let f = lag (lfSaw AR (7 + #(randM (-1.5) 1.5)) #(randM 0 1) * #(randM 11 15)) 0.1 + #(randM 94 102)
  let a = lfPulse KR (1 / #(randM 12 15.6)) #(randM 0 1) 0.16 * 0.05
  let b = sinOsc AR (midiCPS f) #(randM 0 1) * a
  return (rotate2 b (silent 1) #(randM (-1) 1))

birds :: UId m => m UGen
birds = do
  d <- return . sum =<< sequence (replicate 6 node)
  let f i = do return (allpassL i 0.07 #(randM 0 0.06) #(randM 0.7 2.0))
  w <- chainM 12 f d
  return (d * 0.7 + w * 0.3)

-- > birds >>= putStrLn . synthstat
main :: IO ()
main = audition . out 0 =<< birds
