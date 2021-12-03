// tw 0045 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/537
var f = SinOsc.ar(SinOsc.ar(0.11, 0), 0);
var pf = SinOsc.ar(95 * (SinOsc.ar(0.01, 0) +  1), 0) * (SinOsc.ar(0.005, 0) * 50) + 100;
var p = SinOsc.ar(pf, SinOsc.ar(#[98, 97], 0)) * (pi + SinOsc.ar(0.0005, 0));
SinOsc.ar(f, p).tanh * 0.1
