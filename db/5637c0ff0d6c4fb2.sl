/* SinOsc ; phase input only */
let ph = SinOsc(XLine(20, 8000, 10), 0) * 2 * pi;
SinOsc(0, ph) * 0.1
