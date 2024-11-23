/* Modified from a patch by Landon Rose (Jmcc) #8 ; Graph rewrite */
1:4.collect { :i |
	let s = { PinkNoise() * 0.001 } ! 2;
	let p = [0 0.25 0.5 0.75];
	let e = LinSeg(Impulse(0.125, p[i]), [0 2 1 2 0]);
	let m = [32 43 54 89; 10 34 80 120; 67 88 90 100; 14 23 34 45];
	RingzBank(s, m[i].MidiCps, [1], [3]) * e
}.Mix
