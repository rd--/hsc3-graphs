;; SinOsc ; simple fm
var modFreq = [400, MouseX(400, 700, 1, 0.2)];
var modDev = SinOsc(LfNoise2(1) + 1, 0).Abs * 1200;
var modOsc = SinOsc(modFreq, 0) * modDev;
var carFreq = [400, MouseY(400, 500, 1, 0.2)];
SinOsc(carFreq + modOsc, 0) * LfNoise2([1, 2]).Range(0, 0.1)
