(* SinOsc ; https://scsynth.org/t/5169/5 (dietcv) *)
{ :tr |
	var syncEgTop = TRand(8, 20, tr);
	var syncRatio = 2;
	var syncDcy = TRand(0.5, 2, tr);
	var syncEnv = TxLine(syncEgTop / syncRatio, 1, syncDcy, tr);
	var gainEnv = Adsr(Trig(tr, syncDcy), 0.3, 0.3, 0.5, 0.1, -4);
	var freq = { Choose(tr, [45, 48, 52, 53, 57, 58, 60, 64, 65, 70]).MidiCps } ! 5;
	var in = LfTri(freq, 0);
	var phase = Sweep(in, freq * syncRatio * syncEnv);
	var synced = SinOsc(0, (phase % 1) * 2 * pi).Squared;
	var sig = synced * in * gainEnv;
	sig.Splay2 * 0.2
}.OverlapTexture(2, 0, 2).Mix
