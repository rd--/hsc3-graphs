// bowed string (jmcc)
var root = 5;
var scale = [0, 2, 4, 5, 7, 9, 11] + root;
var oct = [24, 36, 48, 60, 72, 84];
var f = (scale.choose + oct.choose).midicps;
var x = BrownNoise.ar.dup * 0.007 * 0.max(LFNoise1.kr(ExpRand(0.125, 0.5)) * 0.6 + 0.4);
var d = Ref.new([Array.series(12, f, f), Array.geom(12, 1, Rand(0.7, 0.9)), Array.fill(12, { Rand(1.0, 3.0) })]);
var k = Klank.ar(d, x, 1, 0, 1);
(k * 0.1).softclip

// ---- calculations
Array.series(12, 2, 3) == 12.iota(2, 3) // iota
Array.series(12, 2, 3) == (12.iota * 3 + 2) // iota
