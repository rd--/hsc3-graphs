// Out ; two Out Ugens summing to one bus each
Out.ar(0, SinOsc.ar(440, 0) * 0.1) <! Out.ar(1, SinOsc.ar(443, 0) * 0.1)
