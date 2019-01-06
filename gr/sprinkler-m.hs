import Sound.SC3.Common.UId {- hsc3 -}
import Sound.SC3.UGen.Rate {- hsc3 -}
import Sound.SC3.UGen.M {- hsc3 -}

sprinkler :: UId m => UGen m
sprinkler =
  let f = lfPulse KR 0.09 0 0.16 * 10 + 7
      t = lfPulse KR f 0 0.25 * 0.1
  in bpz2 (whiteNoise AR * t)

main :: IO ()
main = audition sprinkler
