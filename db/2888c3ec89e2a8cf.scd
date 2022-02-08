SynthDef.new(\sn, {
	arg amp=2, tone=340, tone2=189, snappy=0.3, gate=0, amp2=1;
	var noiseEnv, atkEnv, sig, noise, osc1, osc2, sum;
	noiseEnv = EnvGen.kr(Env.perc(0.001, 4.2, 1, -115), doneAction:2);
	atkEnv = EnvGen.kr(Env.perc(0.001, 0.8,curve:-95), doneAction:0);
	noise = WhiteNoise.ar;
	noise = HPF.ar(noise, 1800);
	noise = LPF.ar(noise, 8850);
	noise = noise * noiseEnv * snappy;
	osc1 = SinOsc.ar(tone2, pi/2) * 0.6;
	osc2 = SinOsc.ar(tone, pi/2) * 0.7;
	sum = (osc1+osc2) * atkEnv * amp2;
	sig = Pan2.ar((noise + sum) * amp * 2.5, 0);
	sig = HPF.ar(sig, 340);
	Out.ar(0, sig);
}).add;
