(* pwm crossfade (jl) *)
var n = [400 500 450 376 600];
var d = 1 / 20;
var [f1, f2] = Demand(Impulse(d, [0 0.5]), 0, Dseq(inf, n));
var f = LfPulse(8, 0, LfTri(d, 1).Range(0, 1)).LinLin(0, 1, f1, f2);
Lpf(Saw(f.Max(376) * [1 0.99]) * 0.5, 8000) * 0.2
