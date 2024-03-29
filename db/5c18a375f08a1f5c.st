"plucked strings (jmcc)"
| str |
str := [
	| i dt t |
	i := [
		| s0 s1 s2 |
		s0 := Impulse freq: (2 rand: 2.2) phase: 0 mul: 0.3.
		s1 := Dust density: 0.5 mul: 0.3.
		s2 := Impulse freq: (SinOsc freq: (0.05 rand: 0.15) phase: (0 rand: (Float pi * 2)) mul: 5 add: 5.2) kr phase: 0 mul: 0.3.
		{s0. s1. s2} atRandom ].
	dt := [ 1 / ((60 rand: 90) floor midiCps) ] value.
	t := Decay in: i value decayTime: 0.1 mul: (PinkNoise mul: 0.1).
	Pan2 in: (CombL in: t maxdelaytime: dt delaytime: dt decaytime: 4) pos: (-1 rand: 1) level: 1 ].
(str dup: 5) sum
