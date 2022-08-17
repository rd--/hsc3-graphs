// https://sccode.org/1-4Q6 ; f0 ; risset
var tr = Impulse.kr(MouseX.kr(0.5, 2, 0, 0.2), 0);
var pan = TRand.kr(-1, 1, tr);
var freq = TRand.kr(20, 2000, tr);
var amp = TRand.kr(0.1, 0.2, tr);
var dur = TRand.kr(0.5, 4, tr);
var ampArray = #[1, 0.67, 1, 1.8, 2.67, 1.67, 1.46, 1.33, 1.33, 1, 1.33];
var durArray = #[1, 0.9, 0.65, 0.55, 0.325, 0.35, 0.25, 0.2, 0.15, 0.1, 0.075];
var freqArray = #[0.56, 0.56, 0.92, 0.92, 1.19, 1.7, 2, 2.74, 3, 3.76, 4.07];
var detuneArray = #[0, 1, 0, 1.7, 0, 0, 0, 0, 0, 0, 0];
var src = 0.to(10).collect({
	arg i;
	var env = EnvGen.ar(Env.perc(0.005, dur * durArray[i], ampArray[i], -4.5), tr);
	SinOsc.ar(freq * freqArray[i] + detuneArray[i], 0) * amp * env;
}).sum;
Pan2.ar(src, pan, 1)
