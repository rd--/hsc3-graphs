"sinOsc ; event control"
| f |
f := [:e :i |
 Pan2 in: (SinOsc freq: (e x * 24 + 48) midicps phase: 0) pos: e o * 2 - 1 level: e z * e w * 0.5].
(EventControl numVoices: 16 voiceFunc: f) mix
