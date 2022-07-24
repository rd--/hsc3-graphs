-- sample and hold liquidities (jmcc) #4
let r = MouseX 1 200 exponential 0.1
    t = Recip r
    c = Impulse r 0 * 0.4
    cf = MouseY 100 8000 exponential 0.1
    f = Latch (WhiteNoise () * cf * 0.5 + cf) c
    p = Latch (WhiteNoise ()) c
    i = Pan2 (SinOsc f 0 * Decay2 c (t * 0.1) (t * 0.9)) p 1
in CombN i 0.3 0.3 2
