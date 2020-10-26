-- drummer (tm)

import Sound.SC3 {- hsc3 -}

drummer :: UGen
drummer =
  let n = whiteNoise 'α' AR
      tempo = 4
      tr = impulse AR tempo 0
      tr_2 = pulseDivider tr 4 2
      tr_4 = pulseDivider tr 4 0
      snare = n * decay2 tr_2 0.005 0.5
      bass = sinOsc AR 60 0 * decay2 tr_4 0.005 0.5
      hihat = hpf n 10000 * decay2 tr 0.005 0.5
  in pan2 (snare + bass + hihat) 0 0.4

main :: IO ()
main = audition (out 0 drummer)
