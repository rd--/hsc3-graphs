-- drummer (tm)

import Sound.SC3.UGen.Record.DRF {- hsc3-rec -}

-- > draw drummer
drummer :: UGen
drummer =
  let n = WhiteNoise 'α' AR
      tempo = 4
      tr = Impulse AR tempo 0
      tr_2 = PulseDivider tr 4 2
      tr_4 = PulseDivider tr 4 0
      snare = n * Decay2 tr_2 0.005 0.5
      bass = SinOsc AR 60 0 * Decay2 tr_4 0.005 0.5
      hihat = HPF n 10000 * Decay2 tr 0.005 0.5
  in Pan2 (snare + bass + hihat) 0 0.4

main :: IO ()
main = audition (Out 0 drummer)
