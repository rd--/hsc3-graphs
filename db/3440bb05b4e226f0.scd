// distort, ring modulate & echo input - a real noise fest
var in;
in = SoundIn.ar([0,1], 20).distort.ring1(
	SinOsc.ar(MouseX.kr(10,2000,'exponential'), [0,0.5pi])
) * 0.02;
CombL.ar(
	in,
	0.5,
	MouseY.kr(0,0.5), // mouse y controls delay time
	4,
	1,
	in
)
