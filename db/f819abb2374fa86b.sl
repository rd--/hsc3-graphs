(* https://sccode.org/1-4Qy ; f0 ; 0058 ; requires=Demand.ArrayExpansion *)
let p = Saw([3 4]) * (Saw(1) * 32 + 128) + Duty(1, 0, (Dseq(1, [0 8 1 5]) * [1 4 8]).flop);
let o = SinOsc(Saw(3) * 64 + 99, p) / 9;
CombN(o, 1, 1 / 6, 1).transposed.Mix
