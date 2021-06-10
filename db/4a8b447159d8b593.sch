-- http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)
let b = map (* 99) [1..8]
    f = krate (map (/ 2) b + lfsaw (map ((-8) /) b) 1 * 99)
    n = krate (map (/ 4) b + (lfsaw (map recip b) 1 * 99))
    o = blip f n
    c = combn (o * sinosc (map (8 /) b) (lfsaw (map (99 /) b) 0)) 0.2 0.2 1
in sin (splay c 1 1 0 true) * 0.1
