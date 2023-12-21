(* LorenzL ; randomly modulate params *)
var freq = SampleRate();
var s = LfNoise0(1) * 2 + 10;
var r = LfNoise0(1) * 20 + 38;
var b = LfNoise0(1) * 1.5 + 2;
LorenzL(freq, s, r, b, 0.05, 0.1, 0, 0) * 0.1
