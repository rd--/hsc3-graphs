// VarLag
{var sqr = LFPulse.kr(1, 0, 0.5).range(100, 400)
;var crv = VarLag.kr(sqr, 0.2, Line.kr(-8, 8, 15, doneAction: Done.freeSelf))
;SinOsc.ar(crv, 0) * 0.3}
