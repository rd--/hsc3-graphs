/* 20060914 ; rd ; Graph rewrite ; requires=Sine ; requires=arrayedEnv */
{ :tr |
	let chrd = { :m |
		let ds = 3;
		let du = [5 4 5 7 4 5];
		let d = du * ds;
		EqPan2(
			SinOsc(TxLine(m, m + TRand(0.05, 0.5, tr), d, tr).MidiCps, 0),
			TxLine(TRand(-1, 1, tr), TRand(-1, 1, tr), d, tr)
		).Sum * Sine(tr, du.max * ds) * TRand(0.005, 0.01, tr)
	};
	let scale = [0 2 4 5 7 9 11];
	let octaves = [4 5 6 7];
	let mnn = scale.collect { :n |
		octaves.collect { :o |
			n + (o * 12)
		}
	}.++;
	let chd = {
		Choose(tr, mnn)
	} ! 6;
	{
		chrd(chd)
	} !+ 7
}.OverlapTexture(21, 0, 3).Mix
