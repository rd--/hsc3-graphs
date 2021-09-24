-- sinOsc ; https://scsynth.org/t/what-kind-of-synthesis-is-this/4318/30
let mratio = 4
    amp = 0.2
    boost = 2
    tr = impulse ar (lfNoise2 kr 1 `in_exprange` (1, 100)) 0
    envgen x = let c = EnvNum (-8) in envGen ar tr 1 0 1 DoNothing (envPerc_c 0.0001 x 1 (c,c))
    freq = (midiCps 60.5 / 16) * (linExp (envgen 0.4) 0 1 1 40)
    ix = mouseY kr 0 2 Linear 0.1
    sig = sinOsc ar freq (sinOsc ar (freq * mratio) 0 * ix)
in tanh (pan2 sig 0 boost) * envgen 1 * amp
