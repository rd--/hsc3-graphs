// http://earslap.com/weblog/music-release-laconicism.html
var k = Duty.ar(6.4, 0, Dseq([0.05, Drand([0.04, 0.08], 1)], inf));
Splay.ar(Integrator.ar((LFNoise0.ar(5.dup(3)) * k).round(k / 10), 1).sin.sqrt.tanh, 0.3, 1, 0, true)
