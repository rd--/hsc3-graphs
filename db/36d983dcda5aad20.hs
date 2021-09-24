-- blitB3Square ; consider difference in CPU usage (excessive wire use,-w 1024)
let sqr_osc rt freq = X.blitB3Square rt freq 0.99 -- pulse rt f 0.5
    f z = midiCps (range 36 72 (lfNoise0Id z kr (randId z 2 3)))
    l z = randId z (-1) 1
    o z = pan2 (sqr_osc ar (f z) * 0.1) (l z) 0.1
in sum (map o [0::Int .. 99])
