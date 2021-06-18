-- tremulate (jmcc) #1 ; texture=xfade,0.5,2,inf
let o = fsinosc (rand 500 900 * [1,1.2,1.5,1.8]) 0
    a = max 0 (lfnoise2 (rrandn 4 30 90)) * 0.1
    l = rrandn 4 (-1) 1
in mix (pan2 o l a)
