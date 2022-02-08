"jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit)"
| t sinosc k b n f0 fMul e |
t := Impulse freq: 0.1 phase: 0.
sinosc := [ :freq | (Phasor trig: t rate: SampleDur new * freq start: 0 end: 1 resetPos: 0 mul: 2 * Float pi) sin ].
k := 160.
b := TRand lo: 2 hi: 2.25 trig: t.
n := TRand lo: 0.002 hi: 0.02 trig: t.
f0 := TRand lo: 90 hi: 180 trig: t.
fMul := b ** (k iota * n).
e := Decay2 in: t attackTime: 1 decayTime: 10 mul: 0.1.
Splay2 inArray: (sinosc value: fMul * f0) * e
