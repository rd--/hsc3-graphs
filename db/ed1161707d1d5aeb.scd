// https://sonomu.club/@lukiss/11153496993558134
var p = {
	var a = (0 .. 3).collect { | n |
		n * 12 + [0, 3, 7, 10]
	}.flat - 24;
	SinOsc.ar(5, 0) * 0.01 + a.scramble.midiratio
};
var e = LFSaw.ar(-1 * p, 1).max(0) ** SinOsc.ar(p.value.frac / 8, 0).linlin(-1, 1, 4, 32);
CombC.ar(
	Splay.ar(
		VarSaw.ar(
			147 * p.value,
			0,
			LFSaw.ar(
				p.value.degrad,
				1
			) * (1 / 4) + (1 / 4)
		) * e.sanitize,
		SinOsc.ar(1 / 3, 0)
	),
	0.2, 0.2, 1
)
