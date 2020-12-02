-- selectX ; composite ugen graph
let n = 3/2
    f = mce2 440 441
    a = mce [sinOsc AR f 0, saw AR f, pulse AR f 0.1]
in mix (selectX (lfSaw KR 1 0 * n + n) a * 0.2)
