;; bowed string (jmcc)
var root = 5;
var scale = [0, 2, 4, 5, 7, 9, 11] + root;
var oct = [24, 36, 48, 60, 72, 84];
var f = (scale.atRandom + oct.atRandom).MidiCps;
var x = { BrownNoise() } ! 2 * 0.007 * (LfNoise1(ExpRand(0.125, 0.5)) * 0.6 + 0.4).Max(0);
var k = RingzBank(x, Array.series(12, f, f), Array.geom(12, 1, Rand(0.7, 0.9)), { Rand(1, 3) } ! 12);
(k * 0.1).SoftClip
