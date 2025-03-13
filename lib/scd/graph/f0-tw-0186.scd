/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0186 */
var b = (1 .. 11).rotate(4) * 1.011;
LeakDC.ar(
	Splay.ar(
		Sweep.ar(0, b + 999).fold(
			LFTri.ar(11.11 / b, 0) / 2 - 0.5,
			LFTri.ar(11.1 / b, 0) / 2 + 0.5
		)
	),
	0.995
)
