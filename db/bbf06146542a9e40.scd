// https://github.com/schollz/18000/blob/main/drone/eno.scd - zs
var hz = 550;
var amp = 0.5;
var note = hz.cpsmidi;
// these notes are directly from Eno's Music for Airports
var airports = [
	[5, 7, 4, 2, 0, 12, 7, 5, 7, 4, 2, 0],
	[5, 7, 4, 2, 0, 12, 4, 7, 5, 0],
	[-5, 2, 0, 4, 7, 12, 5, 2, 7, 4, 0, 7, 2, 5, 5, 2, 4, 0],
	[7, 7, 2, 4, 4, 4, 2, 0, 7, 0, 0],
];
var planes = [
	[0, 4, 7, 12],
	[4, 7, 11, 16],
	[-3, 0, 4, 7],
	[-3, 0, 5, 9],
];
// piano stuff
var noiseAttack = 0.002;
var noiseDecay = 0.06;
var tuneUp = 1.0005;
var tuneDown = 0.9996;
var stringDecay = 6.0;
var lpfRatio = 2.0;
var lpfRq = 4.0;
var hpfHz = 40;
var damp = 0;
var dampTime = 0.1;
// have the planeNotes trigger a inverse envelope ; todo: a way to change chords?
var planeNoteChange = Dust.kr(1 / 30) + Impulse.kr(0, 0);
var planeEnv = 1 - EnvGen.kr(Env.perc(3, 10, 0.9), planeNoteChange);
var planeNotes = Demand.kr(TDelay.kr(planeNoteChange, 3), 0, Dxrand(planes, inf));
var noteRate = TChoose.kr(Dust.kr(1) + Impulse.kr(0, 0), [0.02, 0.05, 1, 2, 0.5, 0.25, 2] / 2) * Rand(0.78, 1.32);
var notePulse = Impulse.kr(noteRate, 0);
var seq = Demand.kr(Dust.kr(0.1) + Impulse.kr(0, 0), 0, Dxrand(airports, inf));
var seqNote = Demand.kr(notePulse, 0, Dseq(seq, inf));
var planeSnd = [
	SinOsc.ar((note - 24).midicps, 0) * SinOsc.kr(Rand(0.001, 0.01), 0).range(0.05, 0.15),
	SinOsc.ar((note - 12).midicps, 0) * SinOsc.kr(Rand(0.001, 0.01), 0).range(0.001, 0.05),
	planeEnv * Mix.ar(Array.fill(8, { |i|
		var saw = SawDPW.ar((note + planeNotes[i % 4] + Select.kr(DC.kr(i % 4) < 1, [24.neg, 36.neg])).midicps, 0) * 0.9;
		var lpf = LPF.ar(saw, LinExp.kr(SinOsc.kr(Rand(1 / 30, 1 / 10), Rand(0, 2 * pi)), -1, 1, hz, hz * 5));
		var del = DelayC.ar(lpf, 0.03, LFNoise1.kr(Rand(5, 10)) * 0.01 + 0.02 / 15);
		Pan2.ar(del, VarLag.kr(LFNoise0.kr(1 / 3), 3, 0, 'sine')) / 7
	}))
].sum;
var fltPlaneSnd = [
	MoogLadder.ar(planeSnd.tanh, LinExp.kr(VarLag.kr(LFNoise0.kr(1 / 6), 6, 0, 'sine'), -1, 1, hz * 2, hz * 60)),
	0.55 * DynKlank.ar(
		`[
			[
				(note + planeNotes[0]).midicps,
				(note + planeNotes[1]).midicps,
				(note + planeNotes[2]).midicps,
				(note + planeNotes[3]).midicps
			],
			nil,
			[1, 1, 1, 1]
		],
		PinkNoise.ar([0.004, 0.004])
	)
].sum;
// piano sound from ezra
var noiseHz = VarLag.kr(LFNoise0.kr(1 / 10), 10).range(2000, 5000);
var pianoHz = A2K.kr((note + seqNote - 12).midicps);
var noiseEnv = Decay2.ar(Impulse.ar(noteRate));
var noise = LFNoise2.ar(noiseHz) * noiseEnv;
var dampMul = LagUD.ar(K2A.ar(1.0 - damp), 0, dampTime);
var delayTime = 1.0 / (pianoHz * [tuneUp, tuneDown]);
var string = Mix(CombL.ar(noise, delayTime, delayTime, stringDecay * dampMul));
var pianoSnd = HPF.ar(RLPF.ar(string, lpfRatio * pianoHz, lpfRq) * amp, hpfHz);
// classic PolyPerc
var pianoSnd2 = (
	EnvGen.ar(Env.perc(0.01, 4, 1, -4), notePulse)*
	MoogFF.ar(Pulse.ar((note + seqNote).midicps, 0.5), note.midicps * 1.5)
);
var snd = fltPlaneSnd + SelectX.ar(SinOsc.kr(LFNoise0.kr(0.1).range(0.01, 0.1)).range(0.1, 0.9), [pianoSnd * 0.3, pianoSnd2]);
var sndRvb = nil;
snd = HPF.ar(LPF.ar(snd, (note + 36).midicps), 120) * EnvGen.ar(Env([0, 0, 1], [0.5, 3], 'lin'));
snd = FreeVerb.ar(snd, 0.45, 2.0, 0.5);
// another reverb
sndRvb = snd;
sndRvb = DelayN.ar(sndRvb, 0.03, 0.03);
sndRvb = CombN.ar(sndRvb, 0.1, { Rand(0.01, 0.099) } ! 32, 4);
sndRvb = SplayAz.ar(2, sndRvb, 1, 1, 2, 0, 0.5);
sndRvb = LPF.ar(sndRvb, 1500);
5.do{
	sndRvb = AllpassN.ar(sndRvb, 0.1, { Rand(0.01, 0.099) } ! 2, 3)
};
(sndRvb * 0.1 + snd) * amp
