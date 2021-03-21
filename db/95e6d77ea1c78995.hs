-- chen
let amp = 0.5
    chen_speed_max = 0.01
    chen_sig = X.chen AR (lfCub KR 0.1 0 `in_range` (0.001,chen_speed_max)) 0.5 0.3 0.28
    minfreq = 20
    maxfreq = 2500
    sig = sinOsc AR (linExp chen_sig 0 1 minfreq maxfreq) 0
in splay sig (mceChannel 0 chen_sig) amp 0 True
