// https://sccode.org/1-4Qy ; f0 ; 0347
var f = {
	arg i;
	var c = i / 48;
	var b = c / 72;
	VarSaw.ar((LFSaw.ar(c, 0) * LFSaw.ar(b, 0) * 8 + 9).round(i % 9 + 1) * 25 + c, c, LFSaw.ar(3, i) + 1 / 3) * (LFSaw.ar(b, i / pi) % 1) / 2
};
Splay.ar(f.dup(30))
