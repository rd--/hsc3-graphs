// https://fredrikolofsson.com/f0blog/more-sc-twitter/, f0
var t = Saw.ar([9, 9.01]);
var f = Demand.ar(t, 0, Dseq([0, 0, 0, 0, 0, 0, 500], inf));
var p = SinOsc.ar(Demand.ar(t, 0, Dshuf((0 .. 8) * 99, inf)).lag(0.04), 0);
SinOsc.ar(f, p) / 2
