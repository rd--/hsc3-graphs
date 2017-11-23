-- https://github.com/supercollider-quarks/SynthDefPool/blob/master/pool/ping_mh.scd

import Sound.SC3
import qualified Sound.SC3.Lang.Pattern as P {- hsc3-lang -}

ping_mh :: UGen
ping_mh =
    let freq = control KR "freq" 440
        amp = control KR "amp" 0.2
        dur = control KR "dur" 1
        attack = control KR "attack" 0.001
        pan = control KR "pan" 0
        out_ = control KR "out" 0
        freq1 = freq * rand 'α' 1 1.01
        freq2 = freq1 * rand 'β' 1 1.01
        e = envGen AR 1 amp 0 1 RemoveSynth (envPerc attack dur)
        sig1 = sinOsc AR (mce2 freq1 freq2) 0 * e
        sig2 = pan2 sig1 pan 1
    in out out_ sig2

-- > withSC3 (async (d_recv ping_mh_syn))
ping_mh_syn :: Synthdef
ping_mh_syn = synthdef "ping_mh" ping_mh

main :: IO ()
main =
  P.paudition (P.pbind [(P.K_instr,P.psynth ping_mh_syn)
                       ,(P.K_degree,P.toP [0,2,4,7])
                       ,(P.K_dur,0.25)])

{-
import Sound.SC3.RW.PSynth
rewrite_param_list "freq=440,amp=0.2,dur=1,attack=0.001,pan=0,out=0"
-}
