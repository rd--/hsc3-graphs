"SinOsc ; Modulate phase"
| ph |
ph := SinOsc freq: (XLine start: 20 end: 8000 dur: 10 doneAction: 2) phase: 0 mul: 2 * Float pi.
SinOsc freq: 800 phase: ph mul: 0.1
