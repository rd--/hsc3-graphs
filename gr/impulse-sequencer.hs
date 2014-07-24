-- impulse sequencer (jmcc) SC2

import Sound.SC3.ID {- hsc3 -}

isequ :: ID i => i -> [UGen] -> UGen -> UGen
isequ z s tr = tr * demand tr 0 (dseq z dinf (mce s))

impulse_sequencer :: UGen
impulse_sequencer =
    let -- single sample impulse as trigger
        t = impulse AR 8 0
        -- clave rhythm
        c_sq = isequ 'α' [1,0,0,1,0,0,1,0,0,0,1,0,1,0,0,0] t
        c = decay2 c_sq 0.001 0.3 * fSinOsc AR 1700 0 * 0.1
        -- dee dee dee dee dee
        d_sq = isequ 'β' [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0] t
        d = decay2 d_sq 0.001 0.3 * fSinOsc AR 2400 0 * 0.04
        -- noise drum
        n_sq = isequ 'γ' [1.0, 0.1, 0.1, 1.0, 0.1, 1.0, 0.1, 0.1] t
        n = decay2 n_sq 0.001 0.25 * brownNoise 'δ' AR * 0.1
        -- bass drum
        b_sq = isequ 'ε' [1,0,0.2,0,0.2,0,0.2,0] t
        b = decay2 b_sq 0.001 0.5 * fSinOsc AR 100 0 * 0.2
    in c + d + n + b

main :: IO ()
main = audition (out 0 impulse_sequencer)
