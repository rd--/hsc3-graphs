// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit)
var t = Impulse.ar(0.1, 0);
var sinOsc = { |freq|
	(Phasor.ar(t, freq * SampleDur.ir, 0, 1, 0) * 2 * pi).sin
};
var k = 160;
var b = TRand.ar(2, 2.25, t);
var n = TRand.ar(0.002, 0.02, t);
var f0 = TRand.ar(90, 180, t);
var fMul = b ** Array.series(k, 0, n);
var e = EnvGen.ar(Env.perc(1, 10, 0.1), t);
Splay.ar(sinOsc.value(f0 * fMul), 1, e, 0, true)
