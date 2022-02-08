"DynKlank"
| a |
a := KlankSpec freq: #(800 1071 1153 1723) amp: nil time: nil.
DynKlank input: (Impulse freq: 2 phase: 0) freqscale: 1 freqoffset: 0 decayscale: 1 specificationsArrayRef: a mul: 0.1
