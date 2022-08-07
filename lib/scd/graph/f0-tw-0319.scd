// https://sccode.org/1-4Qy ; f0 ; 0319
var b = 1.to(8);
var c = SinOscFB.ar(b / 16 / 16.16, 0) % 1;
var f = b.withIndexCollect({ arg x, i; [x, i + 6 / 6000 + x] }) * 60;
var e = (SinOscFB.ar([3, 6], 1) * (Lag(c, 0.1) / 3)).max(0);
var o = (SinOscFB.ar(f, c) * e);
Splay2.ar(o)

//--tweet0319
a=SinOscFB;Splay ar:a.ar(collect(b=(1..8),{|x,i|[x,i+6/6e3+x]})*60,c=a.ar(b/16/16.16)%1,a.ar([3,6],1,c.lag/3).max(0))
