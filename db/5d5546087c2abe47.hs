-- synthetic piano (jmcc) #3 ; texture=overlap,6,0,6,inf
let n = iRand 36 90
    s = impulse ar (rand 0.1 0.5) (rand 0 1) * 0.1
    e = decay2 s 0.008 0.04
    c o = let n0 = lfNoise2 ar 3000
              dt = 1 / midiCps (n + o)
          in combL (n0 * e) dt dt 6
    l = ((n - 36) / 27) - 1
    c_ = sum_opt (map c [-0.05,0,0.04])
in pan2 c_ l 1
