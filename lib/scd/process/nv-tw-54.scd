// http://sccode.org/1-V (nv) [Line 54]
var f = 0;
inf.do({
	arg i;
	var n = ((((2 * i) % 6) + 1) + f.floor) / ((i % 5) + 1);
	f = (f + n.log2) % 2;
	{
		var e = Line.kr(0.1, 0, 1, doneAction: 2);
		SyncSaw.ar(2 ** f * 99 + [0, 1], i % 8 + 2 * 52) * e
	}.play;
	0.3.wait
})
