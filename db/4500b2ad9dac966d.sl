/* https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43 ; requires=keywords */
0:9.collect { :i |
	let x = Impulse(freq: 1, phase: i / 10) + Impulse(freq: 0, phase: 0);
	let o = LfSaw(freq: [102, 101], iphase: 0);
	let d = 1 / Latch(in: 1.015 ^ Sweep(trig: Impulse(freq: 0, phase: 0), rate: 1) * 64 % 1 + 1 * 200, trig: x);
	Pluck(in: o, trig: x, maxDelayTime: 1, delayTime: d, decayTime: 4, coef: 0.2)
}.mean * 0.1
