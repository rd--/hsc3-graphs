// f0 ; https://twitter.com/redFrik/status/1395519538008141835
var l = Dseries(start: 1, step: [1,2], length: inf) % Duty.ar(dur: 8.192, reset: 0, level: Dseq(list: (1 .. 6) * 75, repeats: inf));
var c = Duty.ar(dur: 0.004, reset: 0, level: l);
var d = HPF.ar(in: MantissaMask.ar(in: c, bits: 3), freq: 5);
var f = { arg x; SinOscFB.ar(freq: x, feedback: 0).max(0) };
var p = [250,200] * Duty.ar(dur: 4.096, reset: 0, level: Dseq(list: [4,6,5,5,5,5,3] / 4, repeats: inf)).lag(0.1);
var o = SinOscFB.ar(freq: p, feedback: f.value(0.08), mul: f.value(1 / [99,60]) / 3);
LPF.ar(in: (d.sin + SinOscFB.ar(freq: 63, feedback: f.value(0.8), mul: d) / 9 + o).tanh / 2, freq: 10000) * 0.1
