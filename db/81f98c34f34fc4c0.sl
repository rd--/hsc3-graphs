(* Rcd ; div16 *)
let trig = LfPulse(8, 0, 0.001);
let freqs = (1 .. 8) * 100;
let rotate = 0;
let div = 1;
let pulses = Rcd(trig, rotate, 0, div, 0, 0, 0, 0, 0);
let out = Ringz(pulses, freqs, [2, 1, 0.5, 0.3, 0.2, 0.3, 0.5, 1]) * 0.05;
Splay2(out)
