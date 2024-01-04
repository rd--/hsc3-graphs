(* Cheap Singing Synth ; simpler (rd) ; https://github.com/lukiss/Losers-Union-SC-Research *)
var tab = [
	600 1040 2250 2450 2750; 60 70 110 120 130; 0 -7 -9 -9 -20;;
	400 1620 2400 2800 3100; 40 80 100 120 120; 0 -12 -9 -12 -18;;
	250 1750 2600 3050 3340; 60 90 100 120 120; 0 -30 -16 -22 -28;;
	400 750 2400 2600 2900; 40 80 100 120 120; 0 -11 -21 -20 -40;;
	350 600 2400 2675 2950; 40 80 100 120 120; 0 -20 -32 -28 -36
];
var x = LorenzL(24, 10, 28, 2.667, 0.05, 0.1, 0, 0).Sin.Range(1, 4) / Diwhite(inf, 2, 10);
var dur = Duty(x, 0, x);
var trg = TDuty(dur, 0, 1);
var mel = (26 .. 42).degreeToKey([0 2 4 5 7 9 11], 12);
var mnn = Demand(
	trg,
	0,
	Dseq(inf, mel.scramble)
);
var env = Adsr(
	Trig(trg, dur * LfNoise2(4).Range(0.5, 1)),
	dur / 48,
	1 / 4,
	1,
	dur / 2,
	-4
);
var voc = SelectXFocus(
	mnn.LinLin(mel.first, mel.last, 0, tab.size),
	tab,
	0.9,
	true
);
var atk = PinkNoise() * (1 - env);
var sus = LfNoise2(voc.second) * ((env - voc.third.DbAmp) / 2) + voc.first;
Splay(
	Bpf(
		SyncSaw(
			LfNoise2(voc.second) * mnn / (voc.first) + mnn.MidiCps,
			atk + sus
		),
		env - (Perc(trg, 0, 1 / (2 ^ (0 .. 5)) / 8, -4) * 0.5) * voc.first + 30,
		voc.second / voc.first
	).SoftClip * voc.third.DbAmp * env
)
