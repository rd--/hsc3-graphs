-- babbling brook (jmcc) #SC3
-- http://lists.create.ucsb.edu/pipermail/sc-users/2007-April/033239.html

import Sound.SC3 {- hsc3 -}

babbling_brook :: UGen
babbling_brook =
  let b f m a g = let n3 = lpf (brownNoise 'α' AR) f * m + a
                      n4 = onePole (brownNoise 'β' AR) 0.99
                  in rhpf n4 n3 0.03 * g
      x = uclone 'γ' 2 (b 14 400 500 0.006)
      y = uclone 'δ' 2 (b 20 800 1000 0.010)
  in x + y

main :: IO ()
main = audition (out 0 babbling_brook)
