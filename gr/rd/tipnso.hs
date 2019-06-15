-- tipnso (rd)

import Sound.SC3 {- hsc3 -}

tipnso :: UGen
tipnso =
  let x = mouseX KR 1 32 Linear 0.1
      t = impulse AR x 0
      n1 = tiRand 'α' 16 72 t
      n2 = tiRand 'β' 0 1 t
      n3 = pinkNoise 'γ' AR
      e = decay2 t 0.01 (mce2 0.1 0.15)
      f = midiCPS (n1 + 36 + (12 * n2))
      s = sinOsc AR f 0 * e
      b = bpf (n3 * e) (36 + midiCPS n1) (175 / midiCPS n1)
  in (s + b) * mce2 0.15 0.1

main :: IO ()
main = audition (out 0 tipnso)
