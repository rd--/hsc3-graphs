// http://sccode.org/1-1Ni (an)
var a = 0.05;
var ch = [[72, 69, 64], [70, 64, 62], [67, 60, 70], [65, 60, 69], [64, 60, 67], [65, 60, 69]];
var x = ch[0];
var f = {
	var h = [40, 45, 52].choose.midicps;
	var o = { SinOsc.ar(ExpRand.ir(h, h + (h / 64)), 0) * a };
	{
		Splay.ar(o !16) * LFGauss.ar(9, 1 / 4, 0, 0, 2)
	}.play;
	4.wait
};
var g = {
	var h = x.choose.midicps;
	var o = { SinOsc.ar(ExpRand.ir(h - (h / 128), h + (h / 128)), 0) * a * 0.5 };
	{ o.dup(16).splay * LFGauss.ar(6, 1 / 4, 0, 0, 2) }.play;
	0.5.wait
};
var b = { f.loop }.fork;
var c = { g.loop }.fork;
var main = {
	5.do {
		".".postln;
		ch.do { arg i; x = i; x.postln; 10.wait }
	};
	10.wait;
	c.stop;
	4.wait;
	b.stop
};
main.fork

//----
{}.fork => Routine.new(f).play
