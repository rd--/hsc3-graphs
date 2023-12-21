// Dshuf ; https://scsynth.org/t/7095/5 (jh)
var k = 12, g = 4;
var osc = SinOsc.ar(110 * (1 .. k), 0);
var trig = MouseButton.kr(0, 1, 0) + Impulse.kr(0, 0);
var shuffler = Dseq([Dshuf((1 .. k), 1)], inf);
var order = { Demand.kr(trig, 0, shuffler) } ! k;
var x = MouseX.kr(1, g, 0, 0.2);
var mask = (1 .. g).collect { | i |
	((x - i).clip(-1, 1) * 0.5pi).cos
};
var grp = Select.ar(order, osc).clump(12 / g).collect { | each | each.sum };
Splay.ar(grp * mask) * 0.1
