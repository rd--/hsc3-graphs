(* 20060925 ; rd *)
let b = BufAlloc(1, 2048);
let x = MouseX(100, 12000, 0, 0.1);
let y = MouseY(0.01, 0.15, 0, 0.1);
let t = Impulse((LfNoise0([3, 3.25]) * 16) + 18, 0);
let e = Decay2(t, 0.01, TRand(0.005, y, t));
let o = Bpf(WhiteNoise() * e, TRand(10, x, t), TRand(0, 1, t));
let p = PvRandComb(Fft(b, o, 0.5, 0, 1, 0), TExpRand(0.15, 1, t), t);
(o * 0.05) + Ifft(p, 0, 0)
