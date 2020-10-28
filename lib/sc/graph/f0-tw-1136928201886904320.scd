// https://twitter.com/redFrik/status/1136928201886904320
{var f =
 {arg a, i
 ;{var b = [4,2,1,3,5]
  ;var c = round(ar(a,1/b) * b,ar(a,b/9) > 0)
  ;var o = ar(SinOscFB,c ** 2 * ((ar(a,0.02,i) > 0) + 1 * 50),ar(a,c/9) % 1)
  ;var s = o * max(ar(a,1/b * ar(a,b/99,i)),0) * ar(a,0.01,i)
  ;var x = ar(AllpassC,s,1,wrap(c,0.5,1),2)
  ;var y = ar(BPF,x,i * 99 + 400,0.001,ar(a,0.04,i) + 1 * 9)
  ;ar(Splay,x + y) / 3}}
;Mix(collect([LFTri,LFSaw,LFPar],f))}.play
