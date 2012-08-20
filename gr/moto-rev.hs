-- moto rev (jmcc)

import Sound.SC3 {- hsc3 -}

moto_rev :: UGen
moto_rev =
  let f = sinOsc KR 0.2 0 * 10 + 21
      s = lfPulse AR f (mce2 0 0.1) 0.1
  in clip2 (rlpf s 100 0.1) 0.4

main :: IO ()
main = audition (out 0 moto_rev)
