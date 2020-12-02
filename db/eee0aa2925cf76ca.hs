-- demand ; audio rate (poll output is equal for x1 and x2)
let i = lfNoise2 'α' AR 8000
    d = dseq 'β' dinf (mce [i])
    x = mouseX KR 1 3000 Exponential 0.2
    t = impulse AR x 0
    x1 = demand t 0 d
    x2 = latch i t
    s = mce2 x1 x2
    p = poll t s 0 (mce2 (label "x1") (label "x2"))
    o = sinOsc AR (s * 300 + 400) 0 * 0.1
in mrg2 o p
