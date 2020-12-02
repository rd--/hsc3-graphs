// https://twitter.com/redFrik/status/1235224072579100675
{var v = SinOsc
;var f = tab(Char).ascii
;var e = floor(f%pi)
;var b = (tanh(pi)..f)*pi*pi
;var c = b.reciprocal
;var j = ar(v,b*f,c,ar(v,c).max)+ar(AllpassC,ar(LocalIn,f),e,ar(v,c/f)/f+e/e,e,e)
;var o = ar(BPF,ar(Normalizer,j,e/e,c),ar(v,c).exprange(f,e**f*f))
;ar(Splay,o
;ar(LocalOut,o.rotate)
;o).sin}
