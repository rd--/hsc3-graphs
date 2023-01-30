"<https://swiki.hfbk-hamburg.de/MusicTechnology/899> (tw ; tim walters)"
| depth nd |
depth := 8.
nd := [ :k |
	| x y |
	x := [ :f :m :j |
		SinOsc freq: f + (m * 4 * j) phase: m mul: (LfNoise1 freq: j + 1 / f * 4) / 2 ].
	y := x value: 0.1 value: 0 value: 8.
	1 to: depth do: [ :i | y := x value: #(4 8) * i * k value: y value: i ].
y ].
(1 to: 8 collect: nd) sum / 4
