{- https://sccode.org/1-4Qy ; f0 ; 0336 -}
let d = LfSaw(1 / 9, 0);
let b = BufAlloc(1, 30000).BufClear;
let c = GrainBuf(2, d, 24, b, -2, 0, 2, 0, -1, 512);
let o = Bpf(Saw(d > 0 + 1 / 3 * 99) + c, 99, 4).mean;
c <! BufRec(b, 1, o)
