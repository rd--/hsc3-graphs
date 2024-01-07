(* alarm *)
let tone = SinOsc([723, 932, 1012], 0);
let control = Lpf(Stepper(Impulse(23, 0), 0, 0, 2, 1, 0), 70);
SelectX(control, tone) * 0.1
