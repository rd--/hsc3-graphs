"pmOsc ; composite of sinOsc, ie. sinOsc r cf (sinOsc r mf mp * pm) ; modulate carfreq"
(PMOsc carfreq: (Line start: 600 end: 900 dur: 5 doneAction: 0) modfreq: 600 pmindex: 3 modphase: 0) * 0.1