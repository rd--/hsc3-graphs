// https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0071
var b = (2..5);
Splay.ar(
	LFTri.ar(
		(
			LFTri.ar(b / 9 / 9 / 9, 0).round(
				LFTri.ar(9 - b * 99, 9 - b / 9) * LFTri.ar(b / 9, b / 99)
			) * (
				LFTri.ar(9, 0) * (9 - b * 99) + (99 * b)
			)
		).abs,
		0
	)
) * 0.2
