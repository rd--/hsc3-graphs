// SinOsc ; https://llllllll.co/t/45623/25
var freqBase = 200;
var freqRes = MouseY.kr(100, 1200, 0, 0.2);
var pdbase = Impulse.ar(freqBase, 0);
var pd = Phasor.ar(pdbase, 2 * pi* freqBase / SampleRate.ir, 0, 2 * pi, 0);
var pdres = Phasor.ar(pdbase, 2 * pi * freqRes / SampleRate.ir, 0, 2 * pi, 0);
var pdi = LinLin.ar((2 * pi - pd).max(0), 0, 2 * pi, 0, 1);
Lag.ar(SinOsc.ar(0, pdres) * pdi, 1 / freqBase)
