"RBezier - dynamic shifting of control points as oscillator"
| w f |
w := [ :rng | (LFDNoise3 freq: 2) range: rng ].
f := [ :ix |
 | p o |
 p := {0. 0. w value: 0.05 -> 0.25. -1.3. w value: 0.25 -> 0.45. -1.3. 0.5. 0. w value: 0.55 -> 0.75. 1.3. w value: 0.75 -> 0.95. 1.3. 1. 0}.
 o := RBezier haltAfter: 100 dx: 0.0001 freq: (w value: 200 -> 205) phase: 0 param: p.
 Pan2 in: o pos: (IRand lo: -1 hi: 1) level: 0.1 ].
(1 to: 4) mixFill: f
