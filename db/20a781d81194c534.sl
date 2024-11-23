/* http://scsynth.org/t/6230 (cbe) */
let freq = XLine(800, 1200, 100);
let osc = SinOsc(freq, 0);
let step1 = LfPulse(freq / 2, 0, 0.5) * 0.5 + 0.5;
let step2 = Pulse(freq / 2, 0.5) * 0.5 + 0.5;
[osc * step1, osc * step2] * 0.1
