-- sinosc ; <https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157> ; rd (edit)
let k = 100 -- 200 ; c.f. 12 25 50 100 200 400 600 800
    b = 2 -- 4 ; c.f. 2, 3, 4
    n = 0.02 -- 0.002 ; c.f. 0.002 0.004 0.01 0.05 0.1 0.125
    f0 = 120 -- 300 ; c.f. 120 180 240
    fMul = map (b **) (take k [0, n ..])
in splay (sinOsc ar (mce fMul * f0) 0) 1 0.1 0 True
