-- sinOsc ; simple bell-like tone
let f = mce [0.5,1,1.19,1.56,2,2.51,2.66,3.01,4.1]
    a = mce [0.25,1,0.8,0.5,0.9,0.4,0.3,0.6,0.1]
    o = sinOsc AR (500 * f) 0 * a
    e = envGen KR 1 0.1 0 1 RemoveSynth (envPerc 0.01 10)
in mix o * e
