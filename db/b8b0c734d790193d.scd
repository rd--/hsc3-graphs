// https://sccode.org/1-4Qy ; f0 ; 0353
var f = {
	arg i;
	var o = Saw.ar(LFSaw.ar(1 / [99, 100], 0).round(1 / 8) ** 2 * 8);
	AllpassN.ar(RHPF.ar(o, 2 ** i * [99, 50], 0.01), 1, i + 1 / 9, 9) / 9
};
(0 .. 7).collect(f).sum
