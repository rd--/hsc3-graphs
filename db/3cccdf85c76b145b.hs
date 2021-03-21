-- tremulate (jmcc) #1 ; texture=xfade,0.5,2,inf
let f = rand 'α' 500 900
    o = fSinOsc AR (f * mce [1,1.2,1.5,1.8]) 0
    r = X.rRandN 4 'β' 30 90
    a = max 0 (lfNoise2 'γ' KR r) * 0.1
    l = X.rRandN 4 'δ' (-1) 1
in mix (pan2 o l a)