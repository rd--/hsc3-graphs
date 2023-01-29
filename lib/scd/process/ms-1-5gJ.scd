// https://sccode.org/1-5gJ ; «Experiment with roots of unity» by Muse Score ; rewritten for clarity & to print voice data
var divisors = { arg n;
	var answer = List[];
	(1 .. n.sqrt.floor).do { arg i;
		(n % i == 0).ifTrue {
			answer.add(i);
			(i == n.div(i)).ifFalse {
				answer.add(n.div(i))
			 }
		 }
	 };
	answer.sort.asArray
};
var seq = (1 .. 13);
var tau = seq.collect { arg n;
	divisors.value(n).size
};
var param = { arg n, m;
    var divN = divisors.value(n);
	(
		amp: 0.5 / tau,
		dur: (1 / m) / tau,
		freq: 220 / m,
		n: n ! divN.size,
		ks: divN.collect(divisors)
	)
};
var form = [[2], [1], [1, 2], [0], [0, 2], [0, 1], [0, 1, 2]];
var paramSeq = form.collect {
	arg section;
	section.collect { arg voice;
		var m = 3 - voice;
		seq.collect { arg n;
			param.value(n, m)
		}
	}
};
var gen = { arg p;
	Pbind(
		\instrument, 'sin',
		\amp, Pseq(p.amp, 1),
		\dur, Pseq(p.dur, 1),
		\freq, p.freq,
		\n, Pseq(p.n, 1),
		\ks, Pseq(p.ks, 1)
	)
};
var x = paramSeq.collect {
	arg i;
	Ppar(i.collect { arg j;
		Pseq(j.collect { arg p;
			gen.value(p)
		}, 1)
	}, 1)
};
SynthDef('sin', { arg out = 0, freq, amp, ks, n;
	var osc = SinOsc.ar(freq * 2 * pi * ks / n, [0, 0.5] * pi) * amp;
	var env = EnvGen.kr(Env.linen(0.001, 1, 0.01, 1, 'lin'), 1, 1, 0, 1, Done.freeSelf);
	Out.ar(out, osc * env * 0.1)
}).add;
paramSeq.asCompileString.postln;
Pseq(x, inf).play(TempoClock(100 / 60))
