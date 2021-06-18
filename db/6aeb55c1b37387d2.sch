-- synthetic piano (jmcc) #3 ; texture=overlap,6,0,6,inf
let n = irand 36 90
    s = impulse (rand 0.1 0.5) (rand 0 1) * 0.1
    e = decay2 s 0.008 0.04
    c o = let dt = 1 / midicps (n + o)
          in combl (lfnoise2 3000 * e) dt dt 6
    l = ((n - 36) / 27) - 1
in pan2 (mix (map c [-0.05,0,0.04])) l 1
