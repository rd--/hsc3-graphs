// shimmering harmonics ; https://github.com/cianoc/supercollider_fragments
var harmonics = 16;
var f = {
	var amp = 0.max(FSinOsc.kr((1/3).rrand(1/6), 0) * 0.1.rrand(0.9));
	Pan2.ar(FSinOsc.ar(100.exprand(2000), mul: amp), 1.0.rand2)
};
f.dup(harmonics).sum / (2 * harmonics)
