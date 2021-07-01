-- dwgPluckedStiff ; self deleting
let freq = 440
    amp = 0.5
    gate_ = 1
    pos = 0.14
    c1 = 1
    c3 = 30
    inp = let e = envelope [0,1,1,0] [0.001,0.006,0.0005] (map EnvNum [5,-5,-8])
          in amp * lfClipNoiseId 'α' ar 2000 * envGen ar gate_ 1 0 1 DoNothing e
    release = 0.1
    fB = 2.0
    ps = X.dwgPluckedStiff ar freq amp gate_ pos c1 c3 inp release fB
    pan = 0
    z = detectSilence ps 0.001 0.1 RemoveSynth
in mrg2 (pan2 ps pan 0.1) z
