-- sinosc ; <https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157> ; rd (edit)
let k = 160
    t = impulse ar 0.1 0
    sinosc f = sin (phasor ar t (f * sampleDur) 0 1 0 * 2 * pi)
    b = tRand 2 2.25 t
    n = tRand 0.002 0.02 t
    f0 = tRand 90 180 t
    fMul = map (b **) (take k [0, n ..])
    e = envGen ar t 1 0 1 DoNothing (envPerc 1 10)
in splay (sinosc (mce fMul * f0)) 1 0.1 0 True * e
