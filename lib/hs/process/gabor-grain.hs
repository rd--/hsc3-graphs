
gabor grain (see also 'gabor_grain_ugen_graph')

> gabor =
let b = control IR "out" 0
    f = control IR "freq" 440
    s = control IR "sustain" 1
    p = control IR "pan" 0
    a = control IR "amp" 0.1
    w = control IR "width" 0.25
    e = lfGauss AR s w 0 NoLoop RemoveSynth
    o = fSinOsc AR f (pi / 2) * e
    u = offsetOut b (pan2 o p a)
in synthdef "gabor" u

import Sound.SC3.Lang.Pattern {- hsc3-lang -}

granular synthesis, modulating duration, width and pan

paudition (pbind [(K_instr,psynth gabor)
                 ,(K_freq,1000)
                 ,(K_legato,2)
                 ,(K_dur,pbrown 'α' 0.005 0.025 0.001 inf)
                 ,(K_param "width",pbrown 'β' 0.05 0.25 0.005 inf)
                 ,(K_param "pan",pbrown 'γ' (-1) 1 0.05 inf)])

granular synthesis, modulating width only

paudition (pbind [(K_instr,psynth gabor)
                 ,(K_freq,1000)
                 ,(K_dur,0.01)
                 ,(K_param "width",pgeom 0.25 0.995 1250)
                 ,(K_legato,2)])
