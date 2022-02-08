"DynKlank"
| a |
a := KlankSpec freq: #(800 1071 1353 1723) amp: nil time: nil.
DynKlank input: (Dust density: 8 mul: 0.1) freqscale: 1 freqoffset: 0 decayscale: 1 specificationsArrayRef: a
