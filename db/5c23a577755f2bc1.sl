;; SinOsc ; phase input only
var ph = SinOsc(XLn(20, 8000, 10), 0) * 2 * pi;
SinOsc(0, ph) * 0.1
