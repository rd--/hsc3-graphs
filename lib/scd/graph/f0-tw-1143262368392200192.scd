// https://twitter.com/redFrik/status/1143262368392200192
{var c = 4 / 4 / 4
;var d = c * 4 / 44.4
;var f = (VarSaw.ar(d, c, -4.sin) * 4).max(0).ceil * 44 + 44
;var b = VarSaw.ar(f, 4, VarSaw.ar([44 - 4, 4, 44 + 4] / 4.44, 0, 0.5)) / 4
;var o = RLPF.ar(VarSaw.ar(VarSaw.ar(c / 4, c, c).max(0) * 4 + 44, 4, VarSaw.ar([4, 4 / 44, c * 4], 0, 0.5).abs), 44 * 44, c)
;var q = PitchShift.ar(CombC.ar(b, c, c * 4 / f + d, 1), 4 - c, [4 + 4 + 4, 4 * 4, 4 + 4], c, c) * (c + c)
;Splay.ar(o * Line.ar(0, 1, 4, 0) + q ) / 4}

//----
{var a = VarSaw
;var c = 4/4/4
;var d = c*4/44.4
;var f = ar(a,d,c,-4.sin,4).max.ceil*44+44
;var b = ar(a,f,4,ar(a,[44-4,4,44+4]/4.44))/4
;var o = ar(RLPF,ar(a,ar(a,c/4,c,c).max*4+44,4,ar(a,[4,4/44,c*4]).abs),44*44,c)
;var q = ar(PitchShift,ar(CombC,b,c,c*4/f+d),4-c,[4+4+4,4*4,4+4],c,c,c+c)
;ar(Splay,o*ar(Line,dur:4)+q)/4}
