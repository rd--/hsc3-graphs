-- demandEnvGen ; Short sequence with doneAction, linear
let l = dseq 'α' 1 (mce [1300,500,800,300,400])
    s = env_curve_shape EnvLin
    f = demandEnvGen KR l 2 s 0 1 1 1 0 1 RemoveSynth
in sinOsc AR (f * mce2 1 1.01) 0 * 0.1
