import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

-- sin grain with sine envelope (see also 'sine_grain_ugen_graph')
sine =
  let b = control IR "out" 0
      f = control IR "freq" 440
      d = control IR "dur" 0.2
      a = control IR "amp" 0.1
      p = control IR "pan" 0
      o = fSinOsc AR f 0
      s = envSine d a
      e = envGen AR 1 1 0 1 RemoveSynth s
      u = offsetOut b (pan2 o p e)
  in synthdef "sine" u

-- granular synthesis
p = pbind [(K_instr,psynth sine)
          ,(K_midinote,fmap roundE (pbrown 'α' 72 84 1 inf))
          ,(K_detune,pwhite 'β' 0 10 inf)
          ,(K_dur,pbrown 'γ' 0.005 0.15 0.05 inf)
          ,(K_legato,pbrown 'δ' 1 2 0.1 inf)
          ,(K_amp,pbrown 'ε' 0.05 0.25 0.05 inf)
          ,(K_param "pan",pbrown 'ζ' (-1) 1 0.2 inf)]

main = paudition p
