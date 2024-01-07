(* Wind metals (Jmcc) ; texture=overlap,5,2,12,inf *)
let n = 6;
let exc = BrownNoise(2) * 0.007 * (LfNoise1(ExpRand(0.125, 0.5)) * 0.75 + 0.25).Max(0);
let f = { Rand(0, Rand(500, 8000)) + ExpRand(60, 4000) } ! n;
let dt = { Rand(0.1, 2) } ! n;
let s = RingzBank(exc, f, nil, dt) * 0.1;
s.SoftClip
