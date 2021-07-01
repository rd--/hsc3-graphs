-- tremulate (jmcc) #1 ; texture=xfade,0.5,2,inf ; id
let f = randId 'α' 500 900
    o = fSinOsc ar (f * mce [1,1.2,1.5,1.8]) 0
    r = X.rRandNId 4 'β' 30 90
    a = max 0 (lfNoise2Id 'γ' kr r) * 0.1
    l = X.rRandNId 4 'δ' (-1) 1
in mix (pan2 o l a)
