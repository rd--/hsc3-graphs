"PmOsc ; composite of SinOsc, ie. SinOsc r cf (SinOsc r mf mp * pm) ; modulate carfreq"
(PmOsc carfreq: (Line start: 600 end: 900 dur: 5 doneAction: 0) modfreq: 600 pmindex: 3 modphase: 0) * 0.1
