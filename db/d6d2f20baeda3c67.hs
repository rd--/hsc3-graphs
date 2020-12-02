-- demandEnvGen ; coordinate buffer, layout is (initial-level,duration,level,..,loop-duration)
let b = asLocalBuf 'α' [0,0.5,0.1,0.5,1,0.01]
    l_i = dseries 'β' dinf 0 2
    d_i = dseries 'γ' dinf 1 2
    l = dbufrd 'δ' b l_i Loop
    d = dbufrd 'ε' b d_i Loop
    s = env_curve_shape EnvLin
    e = demandEnvGen KR l d s 0 1 1 1 0 5 RemoveSynth
    f = midiCPS (60 + (e * 12))
in sinOsc AR (f * mce2 1 1.01) 0 * 0.1
