// deep trip (jmcc) #9 ; texture=overlap,12,4,4,inf
var f = (LFNoise1.kr(Rand(0, 0.3)) * 60 + 70).midicps;
var a = LFNoise2.ar(f * Rand(0, 0.5)) * (LFNoise1.kr(Rand(0, 8)) * SinOsc.kr(Rand(0, 40), 0) * 0.1).max(0);
var z = SinOsc.ar(f, 0) *  a;
var s = Pan2.ar(z, LFNoise1.kr(Rand(0, 5)), 1);
var c = {
	CombN.ar(s, 0.5, { Rand(0, 0.2) + 0.3 }.dup, 20)
};
s + c.dup.sum
