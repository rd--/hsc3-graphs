// f0 ; https://twitter.com/redFrik/status/1395519538008141835
var c = Duty.ar(0.004, 0, Dseries.dr(1, #[1, 2], inf) % Duty.ar(8.192, 0, Dseq.dr((1 .. 6) * 75, inf)));
var d = HPF.ar(MantissaMask.ar(c, 3),5);
var f = { arg x; SinOscFB.ar(x, 0).max(0) };
var p = #[250, 200] * Duty.ar(4.096, 0, Dseq.dr(#[4, 6, 5, 5, 5, 5, 3] / 4, inf)).lag(0.1);
var o = SinOscFB.ar(p, f.value(0.08)) * f.value(1 / #[99, 60]) / 3;
LPF.ar((d.sin + (SinOscFB.ar(63, f.value(0.8)) * d) / 9 + o).tanh / 2, 10000) * 0.1
