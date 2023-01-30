;; SinOsc ; https://llllllll.co/t/45623/25
var freqBase = 200;
var freqRes = MouseY(100, 1200, 0, 0.2);
var pdbase = Impulse(freqBase, 0);
var pd = Phasor(pdbase, 2 * pi* freqBase / SampleRate(), 0, 2 * pi, 0);
var pdres = Phasor(pdbase, 2 * pi * freqRes / SampleRate(), 0, 2 * pi, 0);
var pdi = LinLin((2 * pi - pd).Max(0), 0, 2 * pi, 0, 1);
Lag(SinOsc(0, pdres) * pdi, 1 / freqBase)
