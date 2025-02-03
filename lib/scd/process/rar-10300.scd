/* https://scsynth.org/t/10300 (Ryan Alexander Alam) */
var ff = 110 * (2 ** (3 / 12));
var cents = { | a |
	1200 * log2(a)
};
var stream = Routine {
	(1 .. inf).do { | i |
		(0 .. 2 * i + 1).do { | j |
			var n = ((i + 1) / i) ** j;
			[i + 1, i, j, cents.value(n), cents.value(n) % 1200].postln;
			(j !== (2 * i + 1)).if {
				[n, 1 / 8].yield
			} {
				[n, 1].yield
			}
		}
	}
};
SynthDef('saw', { | freq=440, gate=1, out=0, pan=0, amp=1 |
	var sound = Saw.ar(freq);
	var env = EnvGen.kr(Env.linen(0.001, 0.0, 4.8, 1.0, -20), gate, 1, 0, 1, 2);
	Out.ar(out, Pan2.ar(sound * env, pan, amp))
}).add;
Routine {
	loop {
		var sn = stream.next;
		Synth('saw', ['freq', sn[0] * ff, 'out', 0]);
		sn[1].wait
	}
}.play
