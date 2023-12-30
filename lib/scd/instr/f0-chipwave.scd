// http://www.fredrikolofsson.com/f0blog/?q=node/620 (f0)

SynthDef(\ioscs,{
	arg out = 0, amp = 0.5, freq = 400, width = 0.25, gate = 1, atk = 0.002, dec = 0, sus = 1, rel = 0.2, ws = #[0, 2, 2, 3, 2, 2, 2, 2, 2], ps = #[0, 12, -12, 0, 7, 0, 7, 0, 7];
	var e = EnvGen.ar(Env.adsr(atk, dec, sus, rel), gate, amp, doneAction:2);
	var w = Duty.ar(0.025, 0, Dseq(ws));
	var p = Duty.ar(0.025, 0, Dseq(ps));
	var f = freq * p.midiratio;
	var ti = LFTri.ar(f, 0, 0.5, 0.5);
	var sq = LFPulse.ar(f, 0, width * 0.5, 2, -1);
	var ns = LFNoise0.ar(f * 10);
	var z = Select.ar(w, [DC.ar(0), ti, sq, ns]);
	Out.ar(out, LeakDC.ar(z * e));
}).add;

a = Pbind(
	\instrument, \ioscs,
	\midinote, Pseq([60, 60, 70, 60, 65, 63], inf),
	\amp, 0.25,
	\dur, 0.25
).play;

a.stop

b = Pbind(
	\instrument, \ioscs,
	\midinote, Pseq([40, 48, 48, 60], inf),
	\amp, 0.5,
	\rel, 0.3,
	\dur, 0.25,
	\width, 0.5,
	\ws, #[[0, 1, 1, 1, 1, 1, 1, 1, 1]],
	\ps, #[[0, 24, 0, 12, 0, -1, 1, -1, 0]],
	\out, 1
).play

b.stop
