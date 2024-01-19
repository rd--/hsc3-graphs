// https://twitter.com/redFrik/status/1509888510525857792
var d = #[8000, 8008];
var b = #[4, 2, 1, 8, 6];
var l = { arg freq;  LorenzL.ar(freq, 10, 28, 2.667, 0.05, 0.1, 0, 0) };
var x = l.value(LorenzL.ar(7, 13, 10, 2.1, 0.1, 0.1, 0.1, 0) + 3 * (4 ** l.value(1) + 0.5) * d) * l.value(1) / 5;
var m = LorenzL.ar(
	d / 4 * b,
	2 ** l.value(2 ** l.value(1)) / 12 + 10,
	Lag2(l.value(b / 3).round(0.5), 0.1) * 12 + 35,
	Lag2(l.value(1 / 11).round(1 / 3), 0.1) / 12 + 0.153,
	0.1,
	0.1,
	0,
	0
);
var y = Splay.ar(9 / b * 0.5.max(l.value(b / 3 + 1)) / 2 * m, 1, 1, 0, true);
x + DelayN(y, 13, 13)

//----
play{ar(a=LorenzL,ar(a,7,13,10,2.1,0.1)+3*(4**ar(a,1)+0.5)*d=[8000,8008])*ar(a,1)/5};defer({play{b=[4,2,1,8,6];ar(Splay,9/b*max(0.5-ar(a,b/3+1))/2*ar(a,d/4*b,2**ar(a,2**ar(a,1))/12+10,ar(a,b/3).round(0.5).lag2*12+35,ar(a,1/11).round(1/3).lag2/12+0.153,0.1))}},13)
