// pkt 26 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/490
var n = 8;
var x = {
	arg i;
	var t = i/n;
	var a = (VarSaw.ar(0.02, t, 0.5) * 7.5).abs;
	var b = VarSaw.ar(0.16, t, 2/3) * a + 300;
	var c = VarSaw.ar(0.064, t, 0.5) * 25 + 50;
	var d = VarSaw.ar(0.012, t, 0.75) * c + 200;
	var e = VarSaw.ar(0.024, t, 0.25) * 0.475 + 0.5;
	var f = VarSaw.ar(100 + i, t, e);
	var g = VarSaw.ar(0.048, 0, 0.5) * 25 + 150;
	var h = VarSaw.ar(i + 1 * g, t, 1/3) * 150;
	var o = SinOsc.ar(h, f * pi) * d + b;
	var z = LeakDC.ar(VarSaw.ar(o, t, 0.5), 0.995);
	Pan2.ar(z, VarSaw.ar(0.02, t, 0.5), 1 / n)
};
Mix.ar(x.dup(n)) * 0.25
