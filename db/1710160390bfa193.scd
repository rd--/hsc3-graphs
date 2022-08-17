// http://earslap.com/weblog/music-release-laconicism.html
var i = { arg freq; Impulse.ar(freq, 0) };
var ph = Integrator.ar(Integrator.ar(i.value(64).lag(LFNoise1.ar(2.dup(2)) * 2 + 2) * 99, 0.9), 0.99).fold2(pi);
SinOsc.ar(LagUD.ar(i.value(2), 0, 0.4) * 360, ph)
