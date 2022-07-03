"DynKlank"
| a |
a := #((800 1071 1153 1723) nil nil) asKlankSpec.
(DynKlank input: (Impulse freq: 2 phase: 0) freqscale: 1 freqoffset: 0 decayscale: 1 specificationsArrayRef: a) * 0.1
