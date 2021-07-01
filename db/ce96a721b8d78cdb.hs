-- splay ; composite UGen ; inArray spread=1 level=1 center=0 levelComp=true ; mouse control
let i = 6
    r = map (\e -> randId e 10 20) (take i ['α'..])
    n = lfNoise2Id 'β' kr (mce r)
    x = mouseX kr (-1) 1 Linear 0.1
    y = mouseY kr 1 0 Linear 0.1
    ci = constant . fromIntegral
    f = mce [1 .. ci i] + 3 * 100
    o = sinOsc ar (n * 200 + f) 0
in splay o y 0.2 x True
