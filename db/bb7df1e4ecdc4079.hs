-- demand ; audio rate (poll output is equal for x1 and x2)
let i = lfNoise2Id 'α' ar 8000
    d = dseqId 'β' dinf (mce [i])
    x = mouseX kr 1 3000 Exponential 0.2
    t = impulse ar x 0
    x1 = demand t 0 d
    x2 = latch i t
    s = mce2 x1 x2
    p = poll t s 0 (mce2 (label "x1") (label "x2"))
    o = sinOsc ar (s * 300 + 400) 0 * 0.1
in mrg2 o p
