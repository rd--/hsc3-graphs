// SvfHp
var f = SinOsc.kr(XLine.kr(0.7,  300,  20,  1),  0) * 3600 + 4000;
SvfHp.ar(Saw.ar(200) * 0.1,  f,  1)
