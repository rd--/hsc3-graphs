"harmonic tumbling (jmcc) #1"
| f t o |
f := 80.
t := XLine start: #(10 11) end: 0.1 dur: 60 doneAction: 0. "trigger probability decreases over time"
o := [ :h |
	| n r e |
	n := Dust density: t mul: 0.02.
	r := Rand lo: 0 hi: 0.5.
	e := Decay2 in: n attackTime: 0.005 decayTime: r.
	FSinOsc freq: (f * h) iphase: 0 mul: e kr ].
((1 to: 10) collect: o) sum
