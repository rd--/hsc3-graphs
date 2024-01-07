// echo input
var in;
in = SoundIn.ar([0,1], 0.1);
CombL.ar(
	in,
	0.5, 				// max delay time
	MouseX.kr(0,0.5),	// mouse x controls delay time
	4,				// echo 60 dB decay time in seconds
	1, 				// scale by unity
	in				// mix with input
)
