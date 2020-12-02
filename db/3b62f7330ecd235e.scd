// LinExp
{var mod = SinOsc.kr(Line.kr(1, 10, 10))
;[SinOsc.ar(mod * 400 + 500),SinOsc.ar(LinExp.kr(mod, -1,1, 100, 900))] * 0.1}
