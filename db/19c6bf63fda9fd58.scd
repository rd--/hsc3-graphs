// monastic resonance ; jmcc #5 ; mouse controls size and reverb time
var decayTime = MouseX.kr(0, 16, 0, 0.2);
var delayScale = MouseY.kr(0.01, 1, 0, 0.2);
var s = AudioIn.ar([1, 2]) * 0.005;
var z = DelayN.ar(s.sum, 0.048, 0.048);
var y = CombL.ar(z, 0.1, { Rand(0.01, 0.09) }.dup(8) * delayScale, decayTime).sum;
5.do({ y = AllpassN.ar(y, 0.050, { Rand(0, 0.05) }.dup, 1) });
LeakDC.ar(y, 0.995)
