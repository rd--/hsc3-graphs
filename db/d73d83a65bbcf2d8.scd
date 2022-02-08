// LFPulse <https://scsynth.org/t/4877>
var cluster = 10.collect({ 20.exprand(20 * 15 / 16) });
var freq = 8.collect({ arg n; (30 / 16) ** n * cluster }).flat;
Splay.ar(SinOsc.ar(freq * LFPulse.ar(0.5).range(1,0.5), 0)) * 0.02
