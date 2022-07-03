"moogLadder ; wind"
| mk |
mk := [ :k |
	| n freq force |
	n := WhiteNoise new.
	force := LinLin in: (LFNoise2 freq: 0.25) kr srclo: -1 srchi: 1 dstlo: 0.25 dsthi: 0.75.
	freq := (force * 88 + 20) midiCps.
	MoogLadder in: n ffreq: freq res: force
].
(1 to: 6 collect: mk) splay2
