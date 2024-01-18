{- https://sccode.org/1-4Qy ; f0 ; 0331 ; requires=demand -}
let b = [3 3 2 2 2 1 2 2 2] / 3;
let c = Spring(TDuty(Dseq(inf, b), 0, 1) / 9, 1, 0);
Ringz(c, 50 * Duty(c + 1 / [6 3], 0, Dseq(inf, Lag(c, 0.1) > 0 + [2 4] / b)), 1)
