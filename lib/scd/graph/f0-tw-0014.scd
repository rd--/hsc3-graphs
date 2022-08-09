// tw 0014 (f0) ; https://twitter.com/redFrik/status/24193534033
var f = {
	arg i;
	var a0 = SinOscFB.ar(i + 1, 1 / 9) * 999;
	var a1 = SinOscFB.ar(1 / 9, 1)  /  9;
	var a2 = SinOscFB.ar(a0, 1 / 9) * a1;
	var a3 = SinOscFB.ar(0.1, 3);
	var a4 = SinOscFB.ar(a2, a3) * (i + 2 * 999);
	var a5 = SinOscFB.ar(1 / 9, 1 / 9);
	SinOscFB.ar(a4, a5)  /  9
};
Pan2.ar(f.dup(9).sum, 0, 0.35)

//----
{a=SinOscFB;sum({|i|a.ar(a.ar(a.ar(a.ar(i+1,1/9,999),1/9,a.ar(1/9,1,1/9)),a.ar(0.1,3),i+2*999),a.ar(1/9,1/9),1/9)}!9)!2}
