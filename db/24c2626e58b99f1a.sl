{- Event control ; http://www.listarc.bham.ac.uk/lists/sc-users/msg68844.html (ml) ; requires=voicer,kr -}
Voicer(1, 16) { :e |
	let numPartials = 40;
	let baseFreq = (e.x * 25 + 48).MidiCps;
	let sig = Decay(K2A(e.w) * 0.1, 0.001) * PinkNoise();
	let rat = [
		1 1.125 1.25 1.333 1.5 1.666 1.875
		2 2.25 2.5 2.666 3 3.333 3.75
		4 4.5 5 5.333 6 6.666 7.5
		8 9 10 10.666 12 13.333 15
		16 18 20 21.333 24 26.666 30
		32 36 40 42.666 48 53.333 60
		64 72 80 85.333 96 106.666 120
		128 144 160 170.666 192 213.333 240
		256 288 320 341.333
	];
	let freq = { baseFreq * rat.atRandom } ! numPartials;
	let amp = { Rand(0.1, 0.9) } ! numPartials;
	let dcy = { Rand(0.5, 9) } ! numPartials;
	let osc = DynRingzBank(sig, freq, amp, dcy);
	let env = LagUd(e.w * e.z, 0.5, 8).kr * 0.1 * numPartials.reciprocal; {- Note .kr! -}
	EqPan2(osc, e.i * 2 - 1) * env
}.Mix
