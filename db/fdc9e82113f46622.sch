-- http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)
let b = map (* 99) [1..8]
    f = map (/ 2) b + LFSaw (map ((-8) /) b) 1 * 99
    n = map (/ 4) b + (LFSaw (map recip b) 1 * 99)
    o = Blip f n
    c = CombN (o * SinOsc (map (8 /) b) (LFSaw (map (99 /) b) 0)) 0.2 0.2 1
in sin (Splay c 1 1 0 True) * 0.1
