-- police state (jmcc) #2

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect {- hsc3 -}

nd :: UGen
nd =
    let n = lfNoise2 'α' AR (rand 'β' 80 120)
        f = sinOsc KR (rand 'γ' 0.02 0.12) (rand 'δ' 0 (pi * 2)) *
            rand 'ε' 0 600 +
            rand 'ζ' 700 1300
    in pan2 (sinOsc AR f 0 * n * 0.1) (rand 'η' (-1) 1) 1

police_state :: UGen
police_state =
  let ns = uclone 'θ' 4 nd
      n0 = uclone 'ι' 2 (lfNoise2 'κ' KR 0.4)
      n1 = lfNoise2 'λ' AR (n0 * 90 + 620)
      n2 = lfNoise2 'μ' KR (mce2 0.3 0.301)
      e = n1 * (n2 * 0.15 + 0.18)
  in combL (mix ns + e) 0.3 0.3 3

main :: IO ()
main = audition (out 0 police_state)
