-- sample and hold liquidities (jmcc) #4
let r = mouseX kr 1 200 Exponential 0.1
    t = recip r
    c = impulse kr r 0 * 0.4
    cf = mouseY kr 100 8000 Exponential 0.1
    f = latch (whiteNoise kr * cf * 0.5 + cf) c
    p = latch (whiteNoise kr) c
    i = pan2 (sinOsc ar f 0 * decay2 c (t * 0.1) (t * 0.9)) p 1
in combN i 0.3 0.3 2
