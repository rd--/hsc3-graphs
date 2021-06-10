-- http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)
let f0 = [100,200,300] + SinOsc ar [0.11,0.22,0.33] 0
    ph0 = SinOsc ar [0.1,0.2,0.3] 0 * 2 * pi
    a0 = 0.1 + SinOsc ar [0.01,0.02,0.03] 0 * 0.05
    i = SinOsc ar f0 ph0 * a0
    w = SinOsc ar (SinOsc ar (SinOsc ar 0.13 0 * 5 + 6) 0 * 8 + 50) 0
    s = Splay i w 0.7 (SinOsc ar 1.2 0 * 0.6) True
in Mix (mceTranspose (GVerb s 20 5 1 0.5 25 0 1 1 30))
