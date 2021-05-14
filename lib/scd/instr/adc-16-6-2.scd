// adc-16-6-2 (adc) #p.489

b = Buffer.read(s, "sounds/a11wlk01-44_1.aiff");

d = SynthDef(\constQ, {
    arg out, bufnum=0, amp=0.1, pan, centerPos=0.5, sustain=0.1, rate=1, freq=400, rq=0.3;
    var ringtime = (2.4 / (freq * rq) * 0.66).min(0.5); // estimated
    var ampcomp = (rq ** -1) * (400 / freq ** 0.5);
    var envSig = EnvGen.ar(Env([0, amp, 0], [0.5, 0.5] * sustain, \welch));
    var cutoffEnv = EnvGen.kr(Env([1, 1, 0], [sustain+ringtime,0.01]), doneAction: 2);
    var startPos = (centerPos - (sustain * rate * 0.5)) * BufSampleRate.ir(bufnum);
    var grain = PlayBuf.ar(1, bufnum, rate, 0, startPos, 1) * envSig;
    var filtered = BPF.ar( grain, freq, rq, ampcomp);
    OffsetOut.ar(out, Pan2.ar(filtered, pan, cutoffEnv))
}, \ir.dup(8)).add;

Pbindef(\gr1Q,
	\instrument, \constQ,
    \bufnum, b.bufnum,
	\sustain, 0.01,
    \amp, 0.2,
	\centerPos, Pn(Penv([1, 2.0], [10], \lin)),
	\dur, Pn(Penv([0.01, 0.09, 0.03].scramble, [0.38, 0.62] * 10, \exp)),
	\rate, Pwhite(0.95, 1.05),
	\freq, Pbrown(64.0, 120, 8.0).midicps,
	\pan, Pwhite(-1, 1, inf),
	\rq, 0.03
).play;

Pbindef(\gr1Q, \rq, 0.05);
Pbindef(\gr1Q, \rq, 0.01);
Pbindef(\gr1Q, \sustain, 0.03, \amp, 0.3);
Pbindef(\gr1Q, \freq, Pbrown(80, 82, 18.0).midicps);
Pbindef(\gr1Q, \rq, 0.03);
Pbindef(\gr1Q, \rate, Pn(Penv([1,1], [6], \lin)));
Pbindef(\gr1Q, \dur, Pwhite(0.01, 0.02));
Pbindef(\gr1Q, \centerPos, Pn(Penv([0, 1.0], [10], \lin)));
