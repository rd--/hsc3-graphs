"https://twitter.com/sluyterrific_sc/status/435684664200540161 (es)"
| f |
f := [ :i |
	| m |
	m := i % (LfNoise2 freq: 0.01 mul: 50 add: 50) + (LfNoise2 freq: 0.1 mul: 10 add: 40).
	SinOsc freq: m midiCps phase: 0 mul: (LfNoise2 freq: 1 mul: 0.01 add: 0.01) ].
((1 to: 99) collect: f) splay2
