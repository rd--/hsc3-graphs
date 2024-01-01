var in = PinkNoise() + SinOsc(600, 0) * 0.1;
MidEq(in, SinOsc(0.2, pi / 2) * 2 + 600, 0.01, -24)
