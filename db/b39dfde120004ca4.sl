/* 27 Oktober 2022 ; https://github.com/lukiss/Losers-Union-SC-Research */
let a = [41 73 123 196];
let f = SinOsc(440, 0);
0:8.do { :i |
	a := a * 5.MidiRatio;
	f := SinOsc(f * a.rotated(i + 3), 0) * SinOsc(f, 0).Tanh
};
Splay(
	LeakDc(f.Tanh, 0.995),
	SinOsc(f.Sum.Abs, 0)
)
