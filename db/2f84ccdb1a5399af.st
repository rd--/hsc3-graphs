"sinOsc ; gliss"
| t l m a f |
t := 60.
l := [ :x | XLine start: (x at: 1) end: (x at: 2) dur: t doneAction: 0 ].
m := #((0.5 0.5) (0.5 1) (1 1.19) (1.19 1.56) (1.56 2) (2.51 2) (3.01 2.66) (4.1 3.01) (4.1 4.1)).
a := #(0.25 0.25 1 0.8 0.5 0.9 0.4 0.3 0.6 0.1 0.1).
f := m collect: l.
(SinOsc freq: f * 500 phase: 0 mul: a * 0.05) splay2
