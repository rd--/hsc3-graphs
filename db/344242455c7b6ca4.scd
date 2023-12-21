// Cheap Singing Synth ; simpler (rd) ; https://github.com/lukiss/Losers-Union-SC-Research
var tab = [
	[[600,1040,2250,2450,2750], [60,70,110,120,130], [0,-7,-9,-9,-20]],
	[[400,1620,2400,2800,3100], [40,80,100,120,120], [0,-12,-9,-12,-18]],
	[[250,1750,2600,3050,3340], [60,90,100,120,120], [0,-30,-16,-22,-28]],
	[[400,750,2400,2600,2900], [40,80,100,120,120], [0,-11,-21,-20,-40]],
	[[350,600,2400,2675,2950], [40,80,100,120,120], [0,-20,-32,-28,-36]],
];
var x = LorenzL.ar(24, 10, 28, 2.667, 0.05, 0.1, 0, 0).sin.range(1, 4) / Diwhite(2, 10, inf);
var dur = Duty.kr(x, 0, x, 0);
var trg = TDuty.kr(dur, 0, 1, 0, 0);
var mel = (26 .. 42).degreeToKey(Scale.choose, 12);
var mnn = Demand.kr(
	trg,
	0,
	Dseq(mel.scramble, inf)
);
var env = Env.adsr(dur / 48, 1 / 4, 1, dur / 2, 1.2, -4, 0.01).kr(
	0,
	Trig.kr(trg, dur * LFNoise2.ar(4).range(0.5, 1))
);
var voc = SelectXFocus.kr(
	mnn.linlin(mel.first, mel.last, 0, tab.size),
	tab,
	0.9,
	true
);
var atk = PinkNoise.ar() * (1 - env);
var sus = LFNoise2.kr(voc[1]) * ((env - voc[2].dbamp) / 2) + voc[0];
Splay.ar(
	BPF.ar(
		SyncSaw.ar(
			LFNoise2.ar(voc[1]) * mnn / (voc[0]) + mnn.midicps,
			atk + sus
		),
		env - Env.perc(0, 1 / (2 ** (0 .. 5)) / 8, 0.5, -4).kr(0, trg) * voc[0] + 30,
		(voc[1] / voc[0])
	).softclip * voc[2].dbamp * env
)
