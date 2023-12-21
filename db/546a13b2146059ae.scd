// Out ; two Out Ugens summing to one bus each
[0, 1].collect { arg i; Out.ar(i, SinOsc.ar([440, 443][i], 0) * 0.1) }
