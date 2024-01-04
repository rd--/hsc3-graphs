(* alarm ; mouse selects timbre *)
var freq = Lpf(Sequencer([723 932 1012], Impulse(1 / 0.05, 0)), 70);
var osc = SinOsc(freq, 0);
var operations = [osc, (osc * pi).Sin, (osc * pi).Cos, ((osc + 0.25) * pi).Cos];
Select(MouseX(0, 4, 0, 0.2), operations) * 0.1
