// https://twitter.com/redFrik/status/582277939653439489
var b = (0.999 .. 9);
Splay.ar(
	HPF.ar(
		MoogFF.ar(
			LFSaw.ar(50 * b, 0) - (Blip.ar(LFSaw.ar(b, 0) + 9, b * 99) * 9),
			LFSaw.ar(b / 8, 0) + 1 * 999,
			LFSaw.ar(b / 9, 0) + 1 * 2,
			0
		),
		9
	) / 3
)

// ---- https://twitter.com/redFrik/status/582277939653439489
a=LFSaw;Splay ar:HPF.ar(MoogFF.ar(a.ar(50*b=(0.999..9))-Blip.ar(a.ar(b)+9,b*99,9),a.ar(b/8)+1*999,a.ar(b/9)+1*2),9)/3
