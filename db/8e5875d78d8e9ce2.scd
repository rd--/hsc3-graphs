//--tweet0319
a=SinOscFB;Splay ar:a.ar(collect(b=(1..8),{|x,i|[x,i+6/6e3+x]})*60,c=a.ar(b/16/16.16)%1,a.ar([3,6],1,c.lag/3).max(0))
