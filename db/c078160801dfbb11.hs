-- f0 <https://twitter.com/redFrik/status/1254441448327479299> ; id
let b = [1,3,5,8,10]
    e = [3,2/3,4,3/2,2]
    c = 0.021
    d = lfTri ar (mce b / 999) 0 `modE` 1
    m = lfTri ar (mce b * c) 0
    l = m * 7 + 20 + dseqId 'α' dinf (mce b `modE` m * 5 + 6)
    j = duty ar (mce e / (12 ** m)) 0 DoNothing l
    f = midiCPS (degreeToKey (asLocalBufId 'β' b) j 12)
    y = decay2 (impulse ar (mce [2/3,1.5,3,1.5,3]) 0) c d * d
    o = sinOscFB ar f ((lfTri ar (c / mce b) 0 + 1) / 3) * y
in freeVerb (splay o 1 1 0 True) 0.1 1 0.5 * 0.2
