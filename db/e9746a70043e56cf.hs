-- dshuf
let a = dseq 'α' dinf (dshuf 'β' 3 (mce [1,3,2,7,8.5]))
    x = mouseX KR 1 40 Exponential 0.1
    t = impulse KR x 0
    f = demand t 0 a * 30 + 340
in sinOsc AR f 0 * 0.1