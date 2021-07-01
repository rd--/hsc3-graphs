-- demandEnvGen ; gate, mouse x toggles sample and hold, mouse button does hard reset
let l = dseqId 'α' 2 (mce [dseriesId 'β' 5 400 200,500,800,530,4000,900])
    x = mouseX kr 0 1 Linear 0.2
    g = (x >** 0.5) - 0.1
    b = mouseButton kr 0 1 0.2
    r = (b >** 0.5) * 2
    s = env_curve_shape EnvSin
    f = demandEnvGen kr l 0.1 s 0 g r 1 0 1 DoNothing
in sinOsc ar (f * mce2 1 1.001) 0 * 0.1
