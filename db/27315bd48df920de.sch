-- http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)
let b = map (* 99) [1..8]
    f = map (/ 2) b + LfSaw (map ((-8) /) b) 1 * 99
    n = map (/ 4) b + (LfSaw (map recip b) 1 * 99)
    o = Blip f n
    c = CombN (o * SinOsc (map (8 /) b) (LfSaw (map (99 /) b) 0)) 0.2 0.2 1
in sin (Splay2 c) * 0.1
