(* alarm ; mouse selects timbre *)
let freq = Lpf(Sequencer([723 932 1012], Impulse(1 / 0.05, 0)), 70);
let osc = SinOsc(freq, 0);
let operations = [osc, (osc * pi).Sin, (osc * pi).Cos, ((osc + 0.25) * pi).Cos];
Select(MouseX(0, 4, 0, 0.2), operations) * 0.1
