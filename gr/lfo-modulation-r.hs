-- lfo modulation (jmcc) #1

import Sound.SC3.UGen.Rate {- hsc3 -}
import Sound.SC3.UGen.Record.DRF {- hsc3-rec -}

lfo_modulation :: UGen
lfo_modulation =
  let o = FSinOsc KR 0.05 0 * 80 + 160
      p = FSinOsc KR (mce2 0.6 0.7) 0 * 3600 + 4000
      s = RLPF (LFPulse AR o 0 0.4 * 0.05) p 0.2
  in CombL s 0.3 (mce2 0.2 0.25) 2

main :: IO ()
main = audition (Out 0 lfo_modulation)
