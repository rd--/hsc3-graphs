// https://twitter.com/n_peeq_t/status/1264595510217719809
var b = 25;
var s = Decay.ar(Dust.ar(5), 1) * SinOsc.ar(b * SinOsc.ar(b, 0) * b, 0);
var f = Resonz.ar(s, b ** 2 * LFNoise0.ar(5).abs + b, 0.1);
GVerb.ar(f, b, 4, 0.1, 0.3, 2, 1, 0.7, 0.5, 300)

//---- https://twitter.com/n_peeq_t/status/1264595510217719809
a=SinOsc;b=25;GVerb.ar(Resonz.ar(Decay.ar(Dust.ar(5),1,a.ar(b*a.ar(b)*b)),b**2*LFNoise0.ar(5).abs+b,0.1),b,4,0.1,0.3,2)
