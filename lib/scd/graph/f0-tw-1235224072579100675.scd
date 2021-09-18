// https://twitter.com/redFrik/status/1235224072579100675
{var v = SinOsc
;var f = Char.tab.ascii
;var e = (f % pi).floor
;var b = 9.iota + pi.tanh * pi * pi
;var c = b.reciprocal
;var j = v.ar(b * f, c, v.ar(c).max) + AllpassC.ar(LocalIn.ar(f), e, v.ar(c / f) / f + e / e, e, e)
;var o = BPF.ar(Normalizer.ar(j, e / e , c), v.ar(c).exprange(f, e ** f * f))
;LocalOut.ar(o.rotate)
;Splay.ar(o).sin}

//---- https://twitter.com/redFrik/status/1235224072579100675
{var v = SinOsc
;var f = tab(Char).ascii
;var e = floor(f%pi)
;var b = tanh(pi).series(nil,f)*pi*pi
;var c = b.reciprocal
;var j = ar(v,b*f,c,ar(v,c).max)+ar(AllpassC,ar(LocalIn,f),e,ar(v,c/f)/f+e/e,e,e)
;var o = ar(BPF,ar(Normalizer,j,e/e,c),ar(v,c).exprange(f,e**f*f))
;ar(LocalOut,o.rotate)
;ar(Splay,o).sin}

//---- https://twitter.com/redFrik/status/1235224072579100675
{ar(Splay,o=ar(BPF,ar(Normalizer,ar(v=SinOsc,(b=(tanh(pi)..f=tab(Char).ascii)*pi*pi)*f,c=b.reciprocal,ar(v,c).max)+ar(AllpassC,ar(LocalIn,f),e=floor(f%pi),ar(v,c/f)/f+e/e,e,e),e/e,c),ar(v,c).exprange(f,e**f*f));ar(LocalOut,o.rotate);o).sin}

//---- calculations
Char.tab.ascii == 9
pi.tanh.series(nil,9) == (9.iota + pi.tanh)
