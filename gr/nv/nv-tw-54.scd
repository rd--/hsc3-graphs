// http://sccode.org/1-V (nv)

{f = 0
;{inf.do(
  {arg i
  ;var n = ((((2 * i) % 6) + 1) + f.floor) / ((i % 5) + 1)
  ;f = (f + n.log2) % 2
  ;{var e = Line.kr(0.1,0,1,1,0,2)
   ;SyncSaw.ar(2 ** f * 99 + [0,1],i % 8 + 2 * 52) * e}.play
  ;0.3.wait})}.r.play}.()

f=0;{inf.do{|i|f=f+log2(2*i%6+1+floor(f)/(i%5+1))%2;play{SyncSaw.ar(2**f*99+[0,1],i%8+2*52)*Line.kr(0.1,0,1,1,0,2)};0.3.wait}}.r.play
