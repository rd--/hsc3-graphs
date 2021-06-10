-- f0 ; https://twitter.com/redFrik/status/1210118661022867458
let b = map recip [2 .. 7]
    d = 1 / 48
    g = cos (cos 0)
    l = [0,-16,0,-16,0,0,-16,0,-16,0,-16,0,0,0,-16,-16,47,0,-16
        ,0,-16,0,-16,0,0,-16,0,0,-16,0,0,0,0,0,-5,-16,-16,-15]
    f = duty b 0 donothing (dseq dinf (map (+ 48) l))
    o = sinoscfb f (max (sinosc d 0) 0) * sin (cos 0)
    c = sinosc 0 (pi ** o)
    p = pitchshift c g (recip b) d d * b
in leakdc (splay (c + p) 1 1 0 true) 0.995 * g
