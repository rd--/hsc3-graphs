-- birds (jmcc)

import Sound.SC3 {- hsc3 -}

node :: UGen
node =
  let f = lag (lfSaw AR (7 + rand 'α' (-1.5) 1.5) (rand 'β' 0 1) * rand 'γ' 11 15) 0.1 + rand 'δ' 94 102
      a = lfPulse KR (1 / rand 'ε' 12 15.6) (rand 'ζ' 0 1) 0.16 * 0.05
      b = sinOsc AR (midiCPS f) (rand 'η' 0 1) * a
  in rotate2 b (silent 1) (rand 'θ' (-1) 1)

-- > putStrLn$synthstat birds
birds :: UGen
birds =
  let d = mix (uclone 'α' 6 node)
      f i = allpassL i 0.07 (rand 'β' 0 0.06) (rand 'γ' 0.7 2.0)
      w = useq 'δ' 12 f d
  in d * 0.7 + w * 0.3

main :: IO ()
main = audition (out 0 birds)
