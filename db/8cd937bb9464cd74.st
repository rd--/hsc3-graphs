"SinOsc ; modulate freq"
| f1 f2 |
f1 := XLine start: 1 end: 1000 dur: 9 doneAction: 2.
f2 := SinOsc freq: f1 phase: 0 mul: 200 add: 800. "(-1,1) ; (-200,200) ; (600,1000)"
SinOsc freq: f2 phase: 0 mul: 0.1
