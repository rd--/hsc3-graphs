-- analog bubbles (jmcc)
let o = lfsaw [8,7.23] 0 * 3 + 80
    f = lfsaw 0.4 0 * 24 + o
    s = sinosc (midicps f) 0 * 0.05
in combn s 0.2 0.2 4
