(* lfo modulation (jmcc) #1 *)
var o = SinOsc(0.05, 0) * 80 + 160;
var p = SinOsc([0.6, 0.7], 0) * 3600 + 4000;
var s = Rlpf(LfPulse(o, 0, 0.4) * 0.05, p, 0.2);
CombL(s, 0.3, [0.2, 0.25], 2)