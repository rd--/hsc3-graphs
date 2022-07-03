// Squine ; compare with SinOsc
[
    SinOsc.ar(SinOsc.ar(XLn.kr(1, 1000, 9), 0) * 200 + 800, 0) * 0.1,
	Squine.ar(SinOsc.ar(XLn.kr(1, 1000, 9), 0) * 200 + 800, 0.5, 0.5, 0) * 0.1
]
