// modal space (jmcc) #8
var b = #[0, 2, 3.2, 5, 7, 9, 10].asLocalBuf;
var x = MouseX.kr(0, 15, 0, 0.1);
var k = DegreeToKey.kr(b, x, 12);
var c = {
	arg n, r;
	var o = SinOsc.ar((r + k + (n * 0.04)).midicps, 0) * 0.1;
	var t = LFPulse.ar(#[48, 55].midicps, 0, 0.15);
	var f = (SinOsc.kr(0.1, 0) * 10 + r).midicps;
	var d = RLPF.ar(t, f, 0.1) * 0.1;
	var m = o + d;
	CombN.ar(m, 0.31, 0.31, 2) + m
};
var n = LFNoise1.kr([3, 3]);
(c.value(n, 48) + c.value(n, 72)) * 0.25
