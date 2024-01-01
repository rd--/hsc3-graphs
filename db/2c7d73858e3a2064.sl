var rate = MouseX(0.2, 2, 1, 0.2);
var trig = Impulse(rate, 0);
var sr = SampleRate();
var x = Phasor(trig, rate / sr, 0, 1, 0);
SinOsc(
	[
		x.LinLin(0, 1, 600, 1000), (* convert range *)
		1000 (* constant second frequency *)
	],
	0
) * 0.1
