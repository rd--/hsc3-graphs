(* https://sccode.org/1-4S6 ; f0 ; 't' *)
let p = Saw([3, 4]) * (Saw(1) * 32 + 128) + Duty(1, 0, (Dseq(1, [0, 8, 1, 5]) * [1, 4, 8]).flop);
let o = SinOsc(Saw(3) * 64 + 99, p) / 9;
CombN(o, 1 / 4, 1 / 2.125, SinOsc(0.005, 1.5 * pi).Range(0, 6)).transposed.Sum
