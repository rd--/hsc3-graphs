{- tw 0041 (f0) ; http://www.fredrikolofsson.com/f0blog/?q=node/537 -}
let s = Sweep(LocalIn(6, 0), 1);
let i = Impulse([1, 0.749, 6, 12, 3, 4], 0);
let o = SinOsc(1 / RunningMax(s, i), 0);
(o.Splay.Tanh / 2 * 0.1) <! LocalOut(o)
