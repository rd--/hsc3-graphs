{- https://github.com/redFrik/udk08-Soft_and_Hard/blob/master/121115soft -}
let tick = Impulse(30, 0);
let freq = TRand(400, 4000, tick);
let decay = TRand(0.2, 0.7, tick);
Ringz(tick, freq, decay) * 0.1
