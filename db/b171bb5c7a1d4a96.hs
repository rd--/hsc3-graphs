-- pitch ; live input tracking, carelessly
let s = hpf (soundIn 0) 90
    a = lag (amplitude kr s 0.01 0.01) 0.2
    [f,_] = mceChannels (pitch s 440 60 4000 100 16 1 0.02 0.5 1 0)
    fq = midiCPS (roundE (lag (cpsMIDI f) 0.1))
in mce [s * 0.1, lfTri ar f 0 * lag a 0.2 * lag (f >** 90 * f <** 500) 0.2]
