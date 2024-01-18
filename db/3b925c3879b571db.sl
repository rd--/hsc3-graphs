{- https://sccode.org/1-4Qy ; tweet0016 -}
let b = BufAlloc(2, 90000).BufClear;
let i = Sweep(BufRd(2, b, Saw(12) * 30000 + 40000, 1, 2), 90000);
let w = BufWrite(Saw([8, 9]), b, i, 1);
(BufRd(2, b, i, 1, 2)  / 2 <! w).transposed.Sum
