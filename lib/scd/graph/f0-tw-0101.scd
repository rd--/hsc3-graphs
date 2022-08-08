// https://sccode.org/1-4Qy ; f0 ; 0101 ; graph variant (rd)
var d = [0] ++ 1.to(9).reverse.integrate;
var f = {
	arg c;
	var a = DelayN.ar(InFeedback.ar(0, 2), 1, 1);
	var o = SinOsc.ar(c + 1 * 99 + [0, 2], a.reverse) / 4;
	var t = d[c - 1];
	DelayN.ar(o * LinSeg.kr(Impulse.kr(1 / 45, 0), [1, 9 - c + 16, 0]), t, t)
};
1.to(9).collect(f).sum
