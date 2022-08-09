// http://sccode.org/1-Td ; sc3-plugins=LFBrownNoise2;
var base = 2.6;
var f = {
	arg out = 0;
	var z1 = Array.geom(5, 2, 2);
	var z2 = Array.geom(4, base/2, 2);
	var z3 = Array.geom(5, base / 4, 2);
	var z4 = Array.geom(5, 1/8, 2);
	var z5 = (4, 6..24);
	var l = `[
		Array.rand(30, 50, 10000),
		Array.rand(30, 0, 1.0),
		Array.rand(30, 0, 1.0)
	];
	var x = MouseX.kr(0, z1.choose);
	var y = MouseY.kr(0, z1.choose);
	var a_ = LFDNoise3.kr(base / 4).range(20, 10000);
	var a = LFBrownNoise2.ar(a_, 0.005);
	var b = GbmanL.ar(x, 3.0.rand2, 3.0.rand2) / 3;
	var c_ = GbmanL.ar(y, 3.0.rand2, 3.0.rand2);
	var c = Impulse.ar(A2K.kr(c_) * base / 4) / 4;
	var d = Dust.ar(z2.choose) / 4;
	var e = Impulse.ar(z2.choose) / 4;
	var g_ = LFDNoise3.kr(base).range(62.rrand(100), 110.rrand(350));
	var g = LFPulse.ar(g_, mul: 0.003);
	var h_ = Dxrand(z3);
	var h = Demand.kr(Impulse.kr(base / 16), 0, h_);
	var i_ = GbmanL.ar(z4.choose, 3.0.rand2, 3.0.rand2);
	var i = A2K.kr(i_);
	var amp = SinOsc.kr(h, mul:0.1 * i, add:0.1);
	var loc = LFTri.kr(base / z5.choose, mul: 0.7.rrand(0.2), add: 0.3.rand);
	var k = Klank.ar(l, [a, b, c, d, e, g].choose);
	Pan2.ar(k, loc, amp)
};
var s = f.dup(4.rrand(8)).sum;
Limiter.ar(FreeVerb.ar(s, 1.0.rrand(0.33)))

//----
thisThread.randSeed = 1000000.rand.postln; /* ie. 296692, 158432, 943449 */
