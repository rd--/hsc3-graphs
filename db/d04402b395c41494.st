"jmcc - inharmonic warbulence ; graph rewrite"
| gen z |
gen := [ :tr |
	| f a r n g |
	f := (TRand lo: 24 hi: 96 trig: tr) midiCps.
	a := (500 / f) min: 1.
	r := TxLine
		start: (TExpRand lo: 0.1 hi: 20 trig: tr)
		end: (TExpRand lo: 0.1 hi: 20 trig: tr)
		dur: 25.6
		trig: tr.
	n := 12.
	g := [
		| fm m |
		fm := (TRand lo: 0 hi: n trig: tr) + 1.
		m := SinOsc freq: r * (TRand lo: 0.9 hi: 1.1 trig: tr) phase: (TRand lo: 0 hi: (2 * Float pi) trig: tr) mul: 0.08 add: -0.04.
		Pan2 in: (SinOsc freq: f * fm phase: 0 mul: ((m max: 0) * (2 / fm))) pos: (TRand lo: -1 hi: 1 trig: tr) level: 1
	].
	(g dup: n) sum * 0.1
].
z := OverlapTexture graphFunc: gen sustainTime: 12.8 transitionTime: 6.4 overlap: 6.
([ CombN in: z maxdelaytime: 0.3 delaytime: [ Rand lo: 0.1 hi: 0.3 ] dup decaytime: 8 ] dup: 5) sum * 0.3
