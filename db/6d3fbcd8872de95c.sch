-- sample and hold liquidities (jmcc) #4
let r = mousex 1 200 exponential 0.1
    t = recip r
    c = impulse r 0 * 0.4
    cf = mousey 100 8000 exponential 0.1
    f = latch (whitenoise () * cf * 0.5 + cf) c
    p = latch (whitenoise ()) c
    i = pan2 (sinosc f 0 * decay2 c (t * 0.1) (t * 0.9)) p 1
in combn i 0.3 0.3 2
