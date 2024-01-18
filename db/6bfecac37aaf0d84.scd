// TSort ; seven sin tones across stereo field ; unsorted tone is mixed quieter
var tr = Impulse.kr(1, 0);
var freq = { TChoose.kr(tr, [60, 62, 64, 65, 67, 69, 71, 72].midicps) } ! 7;
Splay.ar((SinOsc.ar([freq, TSort.kr(tr, freq)], 0) * [0.05, 0.1]).sum)
