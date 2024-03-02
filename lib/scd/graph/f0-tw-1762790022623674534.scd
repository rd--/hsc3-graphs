// https://twitter.com/redFrik/status/1762790022623674534
var b = (0 .. 4);
var l = LocalIn.ar(5, 0);
var y = [0, 3.084, 5.028, 6.972, 10.056];
var z = SinOsc.ar(
	(y + (SinOsc.ar(1 / 5 * l, b / 5 * 2 * pi).round * 12 + 60)).midicps,
	DelayN.ar(l, 1 / 5, 1 / 5) * 2 * pi
) / 5;
LocalOut.ar(z);
Splay.ar(HPF.ar(z, 9))

// ---- calculations
Scale.yu
Scale.yu('mean5')
Scale.yu('mean5')[(0 .. 4)]
