-- forest sounds (paul jones)
-- sc-users, 2007-04-06

import Sound.SC3.Monad

insects :: UId m => m UGen
insects = do
  n1 <- brownNoise AR
  n2 <- lfNoise2 KR 50
  let o = sinOsc KR (n2 * 50 + 50) 0 * 100 + 2000
  return (bpf n1 o 0.001 * 10)

forest_sounds :: UId m => m UGen
forest_sounds = clone 2 insects

main :: IO ()
main = audition . out 0 =<< forest_sounds
