;; WhiteNoise
var o = SinOsc(MouseY(900, 2300, 1, 0.2), 0);
var n = Lag(WhiteNoise(), MouseX(0.1, 1, 0, 0.2) * 0.01);
o * n * 0.1
