-- dseq ; at audio rate
let n = dseq 'α' dinf (mce [1,3,2,7,8,32,16,18,12,24])
    x = mouseX KR 1 10000 Exponential 0.1
    t = impulse AR x 0
    f = demand t 0 n * 30 + 340
in sinOsc AR f 0 * 0.1
