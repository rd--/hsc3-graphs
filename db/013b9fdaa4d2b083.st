"Asr ; event control"
| f |
f := [ :e |
	env := Asr gate: e w attackTime: 0.5 * e y releaseTime: e y * 4 curves: -4.
	SinOsc freq: e p unitCps phase: 0 mul: env * 0.1
].
(Voicer numVoices: 16 voiceFunc: f) splay2
