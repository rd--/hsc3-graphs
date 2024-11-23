let rate = MouseX(0.001, 0.1, 0, 0.2);
let freq = PlayBuf(1, 10, rate, 1, 0, 1, 0) * 110 + 220;
SinOsc(freq, 0) * 0.1
