// blips 001 (jmcc) #SC3d1.5
var blipFunc = {
	var f = XLine.kr(exprand(0.25, 400), exprand(0.25, 400), 4);
	var nh = XLine.kr(exprand(2, 100), exprand(2, 100), 4);
	Blip.ar(f, nh)
};
var synFunc = {
	Pan2.ar(blipFunc.value * blipFunc.value, Line.kr(1.0.rand2, 1.0.rand2, 4), 0.3)
};
var genFunc = {
	if(0.8.coin, synFunc, { Silent.ar(2) })
};
var ppFunc = {
	arg z;
	z = z.distort;
	6.do({ z = AllpassN.ar(z, 0.05, [0.05.rand, 0.05.rand], 4) });
	z
};
Texture.overlapRoutine(genFunc, 2, 1, 12, postProcess: ppFunc)
