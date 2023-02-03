"PmOsc ; composite of SinOsc, ie. SinOsc r cf (SinOsc r mf mp * pm) ; modulate modfreq"
(PmOsc carfreq: 300 modfreq: (Line start: 600 end: 900 dur: 5 doneAction: 0) pmindex: 3 modphase: 0) * 0.1
