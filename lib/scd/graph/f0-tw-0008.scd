// https://sccode.org/1-4Qy ; f0 ; 0008
var x = LFNoise1.ar(0.5.dup(2));
var o = Crackle.ar(x.range(1.8, 1.98));
Formlet.ar(o, Lag.ar(TExpRand.ar(200, 2000, x), 2), x.range(0.0005, 0.001), 0.0012) * 0.25

//----tweet0008
x=LFNoise1.ar(0.5!2);Formlet.ar(Crackle.ar(x.range(1.8,1.98)),TExpRand.ar(200,2e3,x).lag(2),x.range(5e-4,1e-3),0.0012)
