-- http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)
let f0 = [100,200,300] + sinosc [0.11,0.22,0.33] 0
    ph0 = sinosc [0.1,0.2,0.3] 0 * 2 * pi
    a0 = 0.1 + sinosc [0.01,0.02,0.03] 0 * 0.05
    i = sinosc f0 ph0 * a0
    w = sinosc (sinosc (sinosc 0.13 0 * 5 + 6) 0 * 8 + 50) 0
    s = splay i w 0.7 (sinosc 1.2 0 * 0.6) true
in mix (mcetranspose (gverb s 20 5 1 0.5 25 0 1 1 30))
