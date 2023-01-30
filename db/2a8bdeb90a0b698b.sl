;; SinOsc ; modulate phase
var ph = SinOsc(XLn(20, 8000, 10), 0) * 2 * pi;
SinOsc(800, ph) * 0.1
