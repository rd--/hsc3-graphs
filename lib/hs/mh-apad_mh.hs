-- https://github.com/supercollider-quarks/SynthDefPool/blob/master/pool/apad_mh.scd (Mike Hairston)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

apad_mh :: UGen
apad_mh =
    let k = control KR
        f = k "freq" 880
        a = k "amp" 0.5
        aT = k "attack" 0.4
        dT = k "decay" 0.5
        sT = k "sustain" 0.8
        rT = k "release" 1.0
        g = k "gate" 1.0
        o = k "out" 0
        env = envGen KR g a 0 1 RemoveSynth (envADSR_def aT dT sT rT)
        mod1 = range (f * 0.99) (f * 1.01) (sinOsc KR 6 0)
        mod2 = range 0.2 1 (lfNoise2 'α' KR 1)
        mod3 = range 0.5 1 (sinOsc KR (rand 'β' 4.0 6.0) 0)
        sig1 = sinOsc AR (mce2 f mod1) 0 * env
        sig2 = distort sig1 * mod2 * mod3
    in out o sig2

-- > withSC3 (async (d_recv apad_mh_syn))
apad_mh_syn :: Synthdef
apad_mh_syn = synthdef "apad_mh" apad_mh

main :: IO ()
main =
  paudition (pbind [(K_instr,psynth apad_mh_syn)
                   ,(K_degree,toP [0,2,4,7])
                   ,(K_dur,0.25)])
