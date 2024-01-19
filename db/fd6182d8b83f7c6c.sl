{- https://twitter.com/headcube/status/289761321065541633 (Nv) -}
let i = InFeedback(99, 20);
let n = { LfNoise1(0.001) } ! 99 + 1 / 99;
let j = CombL(Lpf(i, 2000), 1, n, 0.05);
let d = { Dust2(0.01) } ! 99;
let x = (j + d).Sin;
Splay2(x) <! Out(20, (x - x.rotated(1)) / 2)
