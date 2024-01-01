var prob = MouseX(0, 1, 0, 0.2);
var trig = CoinGate(prob, Impulse(10, 0));
var freq = TRand([200, 300], [400, 900], trig);
SinOsc(freq, 0) * 0.1
