// https://twitter.com/redFrik/status/23182604046 ; f0 ; 0011
var s = {
	arg o, i;
	SinOsc.ar([i, i + 0.0001] ** 2 * f.value(o, i - 1), f.value(o, i - 1) * 0.0001) * f.value(o, i - 1)
};
var f = { arg o, i; (i > 0).if({ s.value(o, i) }, { o }) };
f.value(60, 6) / 60
