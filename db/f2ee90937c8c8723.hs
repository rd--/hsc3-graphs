-- demandEnvGen ; Frequency modulation
let n = dwhiteId 'α' dinf 200 1000
    x = mouseX kr (-0.01) (-4) Linear 0.2
    y = mouseY kr 1 3000 Exponential 0.2
    s = env_curve_shape (EnvNum undefined)
    f = demandEnvGen ar n (sampleDur * y) s x 1 1 1 0 1 DoNothing
in sinOsc ar f 0 * 0.1
