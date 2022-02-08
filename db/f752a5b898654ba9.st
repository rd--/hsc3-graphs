"moogLadder ; wind"
|mk|
mk := [:k|
 |n freq force|
 n := WhiteNoise new.
 force := (LFNoise2 freq: 0.25) kr inRangeFrom: 0.25 to: 0.75.
 freq := (force * 88 + 20) midiCps.
 MoogLadder in: n ffreq: freq res: force].
((1 to: 6) mceFill: mk) splay2
