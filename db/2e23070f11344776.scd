SynthDef.new(\cpReverb, {
	arg amp=1, gate=0;
	var reverb, revgen;
	revgen = EnvGen.kr(Env.perc(0.1, 4, curve:-9), gate, doneAction:2);
	reverb = WhiteNoise.ar * revgen * 0.02;
	reverb = HPF.ar(reverb, 500);
	reverb = LPF.ar(reverb, 1000);
	Out.ar(0, Pan2.ar(reverb * amp, 0));
}).add;
