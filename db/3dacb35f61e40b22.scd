// this one floats in and out ; https://github.com/cianoc/supercollider_fragments
var totalPartials = 3;
var f = {
	var base = 50.exprand(100);
	var freq = { 1.rrand(24) * base * 1.0.rrand(1.1) }.dup(totalPartials);
	var amp = Array.rand(10, 1.0, 5.0).normalizeSum;
	var res = Klank.ar(Ref.new([freq, amp]), GrayNoise.ar(0.03.rrand(0.1)));
	Pan2.ar(res * 0.max(SinOsc.kr(10 / 1.rrand(5), mul: 0.005)), LFNoise1.kr(1))
};
Mix.ar(f.dup(8)) * LFNoise1.kr(1/10).abs
