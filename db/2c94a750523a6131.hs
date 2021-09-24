-- demandEnvGen ; coordinate buffer, layout is (initial-level,duration,level,..,loop-duration)
let b = asLocalBufId 'α' [0,0.5,0.1,0.5,1,0.01]
    l_i = dseriesId 'β' dinf 0 2
    d_i = dseriesId 'γ' dinf 1 2
    l = dbufrdId 'δ' b l_i Loop
    d = dbufrdId 'ε' b d_i Loop
    s = env_curve_shape EnvLin
    e = demandEnvGen kr l d s 0 1 1 1 0 5 RemoveSynth
    f = midiCps (60 + (e * 12))
in sinOsc ar (f * mce2 1 1.01) 0 * 0.1
