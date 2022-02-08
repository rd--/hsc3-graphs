// sc-140 ; 18 ; Nathaniel Virgo
var p = { PinkNoise.ar() }.dup;
var a = BRF.ar(p + Blip.ar(p + 2, 400), 150, 2) * 0.1;
var l = LPF.ar(p + 0.2 * Dust.ar(0.1), 60);
var b = LPF.ar((FreeVerb2.ar(l.first, l.second, 1, 1, 0.2) * 10000).tanh, 2000);
a + b
