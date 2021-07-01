-- selectX ; composite ugen graph
let n = 3/2
    f = mce2 440 441
    a = mce [sinOsc ar f 0, saw ar f, pulse ar f 0.1]
in mix (selectX (lfSaw kr 1 0 * n + n) a * 0.2)
