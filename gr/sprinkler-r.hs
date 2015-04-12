import Sound.SC3.UGen.Rate {- hsc3 -}
import Sound.SC3.UGen.Record.DRF {- hsc3-rec -}

-- > draw sprinkler
sprinkler :: UGenR
sprinkler =
  let f = lfPulse {rate = KR,freq = 0.09,width = 0.16} * 10 + 7
      t = lfPulse {rate = KR,freq = f,width = 0.25} * 0.1
  in out {input = bpz2 {input = whiteNoise * t}}

main :: IO ()
main = audition sprinkler
