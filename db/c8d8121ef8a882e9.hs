-- dWGPlucked2 ; self deleting
let freq = 440
    amp = 0.5
    gate_ = 1
    c3 = 20
    inp = let e = envelope [0,1,1,0] [0.001,0.006,0.0005] (map EnvNum [5,-5,-8])
          in amp * lfClipNoise 'α' AR 2000 * envGen AR gate_ 1 0 1 DoNothing e
    ps = X.dWGPlucked2 AR freq amp gate_ 0.1 1 c3 inp 0.1 1.008 0.55 0.01
    pan = 0
    z = detectSilence ps 0.001 0.1 RemoveSynth
in mrg2 (pan2 ps pan 0.1) z
