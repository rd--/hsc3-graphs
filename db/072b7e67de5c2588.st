"DmdOn"
| n t f o |
n := Diwhite length: #dinf lo: 60 hi: 72.
t := Impulse freq: 10 phase: 0.
f := DmdOn trig: t reset: 0 demandUGens: n midiCps.
o := SinOsc freq: (Mce with: f with: f + 0.7) phase: 0.
o cubed cubed * 0.1
