/* Slow beating sines (Jmcc) #7 ; texture=xFade,4,4,inf */
let n = 20;
let d = 5;
let p = [];
let q = [];
n.timesRepeat {
	let freq = Rand(24, 84).MidiCps;
	p.add(freq);
	{ p.add(freq + d.Rand2) } ! 2;
	{ q.add(freq + d.Rand2) } ! 3
};
[p, q].collect { :freq |
	SinOscBank(freq, [1], { Rand(0, 2 * pi) } ! (3 * n))
} * 0.1 / n
