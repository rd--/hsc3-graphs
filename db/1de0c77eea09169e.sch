-- http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0)
let s = sweep (localin 6 [0,0,0,0,0,0]) 1
    i = impulse [1,0.749,6,12,3,4] 0
    o = sinosc (1 / runningmax s i) 0
in mrg2 (tanh (splay o 1 1 0 true) * 0.05) (localout o)
