-- babbling brook (jmcc)
-- http://lists.create.ucsb.edu/pipermail/sc-users/2007-April/033239.html

import Sound.SC3.Monadic

babbling_brook :: IO UGen
babbling_brook = do
  let b f m a g = do n1 <- brownNoise AR
                     n2 <- brownNoise AR
                     let n3 = lpf n2 f * m + a
                         n4 = onePole n1 0.99
                     return (rhpf n4 n3 0.03 * g)
  x <- clone 2 (b 14 400 500 0.006)
  y <- clone 2 (b 20 800 1000 0.010)
  return (x + y)

main :: IO ()
main = audition . out 0 =<< babbling_brook

{-
{ var b = { arg f, m, a, g
          ; { var n1 = OnePole.ar(BrownNoise.ar, 0.99)
            ; var n2 = LPF.ar(BrownNoise.ar, f)
            ; RHPF.ar(n1, n2 * m + a, 0.03, g) } }
; var x = b.value(14, 400, 500, 0.006) ! 2
; var y = b.value(20, 800, 1000, 0.010) ! 2
; Out.ar(0, x + y) }.play
-}
