(* https://sccode.org/1-5fc (dst) ; requires=voicer *)
Voicer(16) { :e |
	var tr = Trig(e.w, e.y * 0.002 + 0.001);
	var buf = [0 7 15.93 5 9.7 12 17.5 13.1].asLocalBuf;
	var samp = TExpRand(0.07, 0.5, tr);
	var root = Choose(tr, [23, 30, 35, 37]);
	var atk = TExpRand(0.04, 0.3, tr);
	var decay = TExpRand(6, 15, tr);
	var amp = TRand(0.15, 0.5, tr);
	var bottom = Choose(tr, [2, 5]);
	var top = TRand(7, 9.1, tr);
	var cFreq = e.x * 2300 + 120;
	var rq = samp + TRand(0.1, 0.15, tr);
	var rate = TExpRand(0.1, 3, tr);
	var index = LinLin(LfSaw(samp, 0), -1, 1, bottom, top) * BufFrames(buf);
	var tonic = DegreeToKey(buf, index, 12) + root;
	var env = Decay2(tr, atk, decay) * 0.35;
	var sig = Bpf(SyncSaw(root.MidiCps, tonic.MidiCps) * env, cFreq, rq) * amp;
	var loc = EqPan2(sig, SinOsc(rate * 0.9 + Rand(-0.6, 0.6), 0));
	var cmb = CombL(loc, 0.1, SinOsc(0.01, 0) * 0.03 + 0.07, 5) * 0.7;
	XFade2(Lpf(cmb, 4800), loc, -0.5, 0.3)
}.Mix
