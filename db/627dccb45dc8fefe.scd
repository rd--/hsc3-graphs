// https://sccode.org/1-50L (mk)
var z = PinkNoise.ar();
16.do{
	z = BRF.ar(z, Rand.ir(100, 15000) ! 2, 1)
};
z
