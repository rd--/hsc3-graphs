-- selectX ; as sequencer
let n = 10
    a = mce [517, 403, 89, 562, 816, 107, 241, 145, 90, 224]
    c = n / 2
    f = selectX (lfSaw kr 0.5 0 * c + c) a
in saw ar f * 0.1
