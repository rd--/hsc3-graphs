// https://github.com/LancePutnam/Gamma/blob/master/examples/techniques/additivePacket.cpp
var f0 = 27.5;
var k1 = 0.0;
var k2 = 0.00001;
var size = 512;
var rs = 1.0 / size;
var o = 0.to(size - 1).collect({
	arg i;
	var h = i + 1 + (i * k1) + (i * i * k2);
	var a = 16 * rs / h;
	FSinOsc.ar(f0 * h, 0) * a
}).sum;
Pan2(o, 0, 4)
