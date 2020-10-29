// https://twitter.com/redFrik/status/1105496695637454848
{var a = VarSaw
;var b = (1..15) / 151
;var w = kr(a,b,b,1/5.15,1,1.5).ceil
;var x = kr(Select,kr(a,1/15,1/5,b,5).ceil+5/5,[51*1.5,51,151]).lag(b)
;var y = kr(a,5+b)
;var z = kr(a,b,b,b,b/5,[1.5,5,1])
;var o = ar(a,w * x + y * z,b,kr(a,b)+5/15,kr(a,5-b,b,b,5,5)>1.515)
;var f = 1515**(kr(a,1-b/5)/15+1+b)
;var rq = 1.5**kr(a,b)/5
;ar(Splay,ar(BLowPass,o,f,rq)/5)}
