var b = [50 100 200 400 800 1600].asLocalBuf;
var f = Index(b, LinLin(LfSaw(2, 0), -1, 1, 0, 6));
SinOsc([f, f * 9], 0) * 0.1
