-- synthetic piano (jmcc) #3 ; texture=overlap,6,0,6,inf
let n = IRand 36 90
    s = Impulse (Rand 0.1 0.5) (Rand 0 1) * 0.1
    e = Decay2 s 0.008 0.04
    c o = let dt = 1 / MidiCps (n + o)
          in CombL (LFNoise2 3000 * e) dt dt 6
    l = ((n - 36) / 27) - 1
in Pan2 (Mix (map c [-0.05, 0, 0.04])) l 1
