// https://twitter.com/redFrik/status/1235224072579100675
{var f = 9
;var e = (f % pi).floor
;var b = 9.iota + pi.tanh * pi * pi
;var c = b.reciprocal
;var j = SinOsc.ar(b * f, c) * SinOsc.ar(c, 0).max(0) + AllpassC.ar(LocalIn.ar(f, 0), e, SinOsc.ar(c / f, 0) / f + e / e, e) * e
;var o = BPF.ar(Normalizer.ar(j, e / e , c), SinOsc.ar(c, 0).exprange(f, e ** f * f), 1)
;LocalOut.ar(o.rotate(1))
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
