-- localBuf ; degreeToKey example ('modal space') using local buffer
let n = lfNoise1 'α' KR (mce [3,3.05])
    x = mouseX KR 0 15 Linear 0.1
    b = asLocalBuf 'β' [0,2,3.2,5,7,9,10]
    k = degreeToKey b x 12
    mk_c bf = let f0 = midiCPS (bf + k + n * 0.04)
                  o = sinOsc AR f0 0 * 0.1
                  f1 = midiCPS (mce [48,55])
                  t = lfPulse AR f1 0.15 0.5
                  f2 = midiCPS (sinOsc KR 0.1 0 * 10 + bf)
                  d = rlpf t f2 0.1 * 0.1
                  m = o + d
              in combN m 0.31 0.31 2 + m
in (mk_c 48 + mk_c 72) * 0.25
