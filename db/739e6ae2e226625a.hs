-- tremulate (jmcc) #1 ; texture=xfade,0.5,2,inf
let f = rand 500 900
    o = fSinOsc ar (f * mce [1,1.2,1.5,1.8]) 0
    r = X.randN 4 30 90
    a = max 0 (lfNoise2 kr r) * 0.1
    l = X.randN 4 (-1) 1
in mix (pan2 o l a)
