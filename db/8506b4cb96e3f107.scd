// ring modulate & echo input
var in;
in = SoundIn.ar([0,1], 0.4) * SinOsc.ar(MouseX.kr(10,2000,'exponential'), [0,0.5pi]);
CombL.ar(
	in,
	0.5,
	MouseY.kr(0,0.5),	// mouse y controls delay time
	4,				// echo 60 dB decay time in seconds
	1, 				// scale by unity
	in				// mix with input
)
