{- http://twitter.com/redFrik/status/1374139774269857798 ; F0 -}
let b = [1 0.5 1.25];
let c = SinOscFb(3, 0) > 0;
let x = SinOscFb(SinOscFb(1 / 64, 0) < 0 * 9 + 50, SinOscFb(1 / 8, 0) + 1 / 2) * Hpf(c, 4) * 5;
let f0 = Lag3Ud(Demand(SinOscFb(1 / 12, 0), 0, Dseq(inf, [1, 1, 2, 3, 4, 1] * (SinOscFb(1 / 96, 0) < 0.5 * 19 + 99)) * b), 1, 3);
let y = SinOscFb(f0, SinOscFb(b / 16, 0) + 1 / 3).Splay;
let z = Hpf(c > 0.1, 9 ^ SinOscFb(1 / 19, 0) + 3) * SinOscFb([12, 9] * 99, 0) / 6;
([x x] + y + z).Tanh * 0.1
