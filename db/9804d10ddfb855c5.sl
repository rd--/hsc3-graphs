/* Slow beating sines (Jmcc) #7 ; Graph rewrite ; requires List>>add */
{ :tr |
	let n = 20;
	let p = [];
	let q = [];
	n.timesRepeat {
		let freq = TRand(24, 84, tr).MidiCps;
		let d = 5;
		p.add(freq);
		{ p.add(freq + TRand(d.negated, d, tr)) } ! 2;
		{ q.add(freq + TRand(d.negated, d, tr)) } ! 3
	};
	[p, q].collect { :freqList |
		freqList.collect { :freq |
			SinOsc(freq, TRand(0, 2 * pi, tr))
		}.Sum
	} * 0.1 / n
}.OverlapTexture(4, 4, 2).Mix
