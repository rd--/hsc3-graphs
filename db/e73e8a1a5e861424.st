"Dseq ; rather than MCE expansion at tr, it can be clearer to view tr as a functor"
| m o |
m := [:f | Demand trig: (Impulse freq: f phase: 0) reset: 0 demandUGens: (Dseq repeats: #dinf list: #(60 63 67 69))].
o := SinOsc freq: ({2. 3. 5} collect: m) mce midicps kr phase: 0 mul: 0.1.
Splay input: o spread: 1 level: 1 center: 0 levelComp: true
