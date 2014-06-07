"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~coolant = {
	var p = 10;
	Klank.ar(
		[
			`[Array.fill(p, { 40 + 2000.0.rand }),nil,nil],
			`[Array.fill(p, { 40 + 2000.0.rand }),nil,nil]
		],
		OnePole.ar(
			BrownNoise.ar([0.002,0.002]),
			0.95
		)
	)
}

~overlap_texture.({~coolant},susdur:4,transdur:4,overlaps:2)
