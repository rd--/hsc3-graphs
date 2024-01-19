{- F0 ; http://twitter.com/redFrik/status/1105496695637454848 -}
let b = (1 .. 15) + 1 / 151;
let w = (VarSaw(b, b, 1 / 5.15) * 1 + 1.5).Ceiling;
let s = BufRd(1, [51 * 1.5, 51, 151].asLocalBuf, (VarSaw(1/15, 1/5, b) * 5).Ceiling + 5 / 5, 0, 1);
let x = Lag(s, b);
let y = VarSaw(5 + b, 0, 0.5);
let z = VarSaw(b, b, b) * b / 5 + [1.5, 5, 1];
let m = VarSaw(5 - b, b, b) * 5 + 5;
let o = VarSaw(w * x + y * z, b, VarSaw(b, 0, 0.5) + 5 / 15) * (m > 1.515);
let f = 1515 ^ (VarSaw(1 - b / 5, 0, 0.5) / 15 + 1 + b);
let rq = 1.5 ^ VarSaw(b, 0, 0.5) / 5;
BLowPass(o, f, rq).Splay / 5
