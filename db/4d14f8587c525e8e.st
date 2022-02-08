"Line ; self deleting"
a := Line start: 0.1 end: 0 dur: 1 doneAction: 2.
SinOsc freq: 440 phase: 0 mul: a
