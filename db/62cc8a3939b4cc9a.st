"ADSR ; event control"
| f |
f := [ :e |
  env := ADSR gate: e w attackTime: 0.5 * e y decayTime: e y * 0.75 sustainLevel: 0.65 releaseTime: e y * 4 curve: -4.
  SinOsc freq: e p unitCps phase: 0 mul: env
].
(Voicer numVoices: 16 voiceFunc: f) splay2 * 0.1
