(* Bowed string (Jmcc) ; .randomFloat *)
var root = 5;
var scale = [0 2 4 5 7 9 11] + root;
var oct = [24 36 48 60 72 84];
var f = (scale.atRandom + oct.atRandom).MidiCps;
var x = BrownNoise(2) * 0.007 * (LfNoise1(ExpRand(0.125, 0.5)) * 0.6 + 0.4).Max(0);
var k = RingzBank(
	x,
	12.arithmeticSeries(f, f),
	12.geometricSeries(1, 0.7.randomFloat(0.9)),
	{ 1.randomFloat(3) } ! 12
);
(k * 0.1).SoftClip
