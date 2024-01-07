(* SinOsc ; https://scsynth.org/t/5169/5 (dietcv) *)
{ :tr |
	let syncEgTop = TRand(8, 20, tr);
	let syncRatio = 2;
	let syncDcy = TRand(0.5, 2, tr);
	let syncEnv = TxLine(syncEgTop / syncRatio, 1, syncDcy, tr);
	let gainEnv = Adsr(Trig(tr, syncDcy), 0.3, 0.3, 0.5, 0.1, -4);
	let freq = { Choose(tr, [45, 48, 52, 53, 57, 58, 60, 64, 65, 70]).MidiCps } ! 5;
	let in = LfTri(freq, 0);
	let phase = Sweep(in, freq * syncRatio * syncEnv);
	let synced = SinOsc(0, (phase % 1) * 2 * pi).Squared;
	let sig = synced * in * gainEnv;
	sig.Splay2 * 0.2
}.OverlapTexture(2, 0, 2).Mix
