-- demandEnvGen ; frequency envelope with random times
let l = dseq 'α' dinf (mce [204,400,201,502,300,200])
    t = drand 'β' dinf (mce [1.01,0.2,0.1,2.0])
    y = mouseY KR 0.01 3 Exponential 0.2
    s = env_curve_shape EnvCub
    f = demandEnvGen AR l (t * y) s 0 1 1 1 0 1 DoNothing
in sinOsc AR (f * mce2 1 1.01) 0 * 0.1
