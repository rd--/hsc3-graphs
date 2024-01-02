(* 20060914 ; rd ; graph rewrite ; requires=Sine ; requires=arrayedEnv *)
{ :tr |
	var chrd = { :m |
		var ds = 3;
		var du = [5, 4, 5, 7, 4, 5];
		var d = du * ds;
		var freq = TxLine(m, m + TRand(0.05, 0.5, tr), d, tr).MidiCps;
		var env = Sine(tr, du.max * ds) * TRand(0.005, 0.01, tr);
		var pos = TxLine(TRand(-1, 1, tr), TRand(-1, 1, tr), d, tr);
		var osc = SinOsc(freq, 0);
		EqPan2(osc, pos).Sum * env
	};
	var scale = [0, 2, 4, 5, 7, 9, 11];
	var octaves = [4, 5, 6, 7];
	var mnn = scale.collect { :n | octaves.collect { :o | n + (o * 12) } }.concatenation;
	var chd = { Choose(tr, mnn) } ! 6;
	{ chrd(chd) } !+ 7
}.OverlapTexture(21, 0, 3).Mix