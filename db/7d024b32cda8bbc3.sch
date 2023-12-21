-- http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0)
let s = Sweep (LocalIn 6 [0, 0, 0, 0, 0, 0]) 1
    i = Impulse [1, 0.749, 6, 12, 3, 4] 0
    o = SinOsc (1 / RunningMax s i) 0
in Mrg2 (Tanh (Splay2 o) * 0.05) (LocalOut o)
