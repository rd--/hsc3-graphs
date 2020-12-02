-- blitB3Square ; consider difference in CPU usage (excessive wire use,-w 1024)
let sqr_osc rt freq = X.blitB3Square rt freq 0.99 -- pulse rt f 0.5
    f z = midiCPS (range 36 72 (lfNoise0 z KR (rand z 2 3)))
    l z = rand z (-1) 1
    o z = pan2 (sqr_osc AR (f z) * 0.1) (l z) 0.1
in sum (map o [0::Int .. 99])
