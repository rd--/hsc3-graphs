// http://sccode.org/1-4Tw (tb)
var i = Impulse.ar([1,3,5].reciprocal, [0,0.133,0.5]).sum;
var f = { |st z|
	[TDuty.ar(0.25.max(Timer.ar(st[0])), 0, 1, 0, 0)] ++ st
};
var n = (1 .. 10).inject([i],f);
var g = { |x j|
	SinOsc.ar((4000 + (j * 500)), 0) * Decay2.ar(x, 0.01, 0.2)
};
var m = n.collect(g);
Splay.ar(m)

// ---- http://sccode.org/1-4Tw (tb) ; keywords
var i = Impulse.ar(freq: [1,3,5].reciprocal, phase: [0,0.133,0.5]).sum;
var f = { |st z|
	[TDuty.ar(dur: 0.25.max(Timer.ar(trig: st[0])), reset: 0, level: 1, doneAction: 0, gapFirst: 0)] ++ st
};
var n = (1 .. 10).inject([i],f);
var g = { |x j|
	SinOsc.ar(freq: (4000 + (j * 500)), phase: 0) * Decay2.ar(in: x, attackTime: 0.01, decayTime: 0.2)
};
var m = n.collect(g);
Splay.ar(inArray: m)
