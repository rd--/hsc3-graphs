// https://sonomu.club/@lukiss/109733997253009229 ; Jan 23, 2023
var c = (9, 12 .. 61).degreeToKey(Scale.choose);
var o = c.midicps.collect { | f | SinOsc.ar(f, 0) };
var e = SinOsc.ar(2 / c.log10, 0) * LFSaw.ar(11 / c.neg, 0).max(0).lag3(0.1);
Splay.ar(
	LeakDC.ar(o * e, 0.995),
	SinOsc.ar(1 / c @ 0, 0)
)
