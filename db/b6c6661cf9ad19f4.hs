-- https://twitter.com/headcube/status/289761321065541633 (nv)
let nc = 80
    i = inFeedback nc 20
    n = mceFill nc (\_ -> lfNoise1 kr 0.001 + 1) / constant nc
    j = combL (lpf i 2000) 1 n 0.05
    d = mceFill nc (\_ -> dust2 ar 0.01)
    x = sin (j + d)
in mceConcat [splay x 1 1 0 True
             ,mce (replicate 18 0)
             ,(x - mceRotate 1 x) / 2]
