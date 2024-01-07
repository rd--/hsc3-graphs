(* SinOsc ; https://llllllll.co/t/45623/25 *)
let freqBase = 200;
let freqRes = MouseY(100, 1200, 0, 0.2);
let pdbase = Impulse(freqBase, 0);
let pd = Phasor(pdbase, 2 * pi* freqBase / SampleRate(), 0, 2 * pi, 0);
let pdres = Phasor(pdbase, 2 * pi * freqRes / SampleRate(), 0, 2 * pi, 0);
let pdi = LinLin((2 * pi - pd).Max(0), 0, 2 * pi, 0, 1);
Lag(SinOsc(0, pdres) * pdi, 1 / freqBase)
