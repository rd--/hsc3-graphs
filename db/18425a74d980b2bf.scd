// max
SinOsc.ar(XLine.kr([100, 200], [400, 100], 2).inject(0, { arg i, j; i.max(j) }), 0) * 0.1
