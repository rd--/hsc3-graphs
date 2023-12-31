(* alarm *)
var tone = SinOsc([600, 800], 0);
var control = Lpf(LfPulse(2, 0, 0.5), 70);
SelectX(control, tone) * 0.1
