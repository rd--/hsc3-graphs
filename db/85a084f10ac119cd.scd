// distort input
var gain;
gain = MouseX.kr(1,100,'exponential');	// mouse x controls gain into distortion
SoundIn.ar([0,1], gain).distort * 0.4
