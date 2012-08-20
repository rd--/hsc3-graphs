-- insects (sam pluta)

import Sound.SC3.Monad {- hsc3 -}

insect :: UId m => m UGen
insect = do
  r1 <- rand 2000 3000
  r2 <- rand 0.05 0.1
  n1 <- lfNoise2 KR (r2 * 50 + 50)
  r4 <- rand 1 10
  r5 <- rand 0.05 0.1
  n2 <- lfNoise2 KR r5
  let a = sinOsc KR r4 0 * 0.5 + 0.5
      o = sinOsc AR (r1 + n1) r2 * 0.005 * a
  return (pan2 o n2 1)

insects :: UId m => m UGen
insects = return.sum =<< sequence (replicate 60 insect)

main :: IO ()
main = audition . out 0 =<< insects
