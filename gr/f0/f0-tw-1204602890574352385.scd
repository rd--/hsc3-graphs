// https://twitter.com/redFrik/status/1204602890574352385

play{a=VarSaw;ar(LeakDC,ar(LPF,ar(Splay,ar(b=CombN,ar(b,cos(ar(a,[11-1,11<<1,11,11>>1,11+1]**ar(a,11.1,1,1/11,1,1.11111111))*ar(a,d=1/(1..11)/1,d,1/11,ar(a,1.11/d,1,1.1-d,11),1)),d,d+1/(111>>1),ar(a,d*11/111,1,1/(c=1+1),1,1.1/c,d).max,1/c),c,c/11/d)),11111)).sin}

play
{var a = VarSaw
;var b = CombN
;var c = 1+1
;var d = 1/(1..11)/1
;var p = ar(a,[11-1,11<<1,11,11>>1,11+1]**ar(a,11.1,1,1/11,1,1.11111111))
;var q = ar(a,d,d,1/11,ar(a,1.11/d,1,1.1-d,11),1)
;var r = ar(a,d*11/111,1,1/c,1,1.1/c,d).max
;ar(LeakDC,ar(LPF,ar(Splay,ar(b,ar(b,cos(p*q),d,d+1/(111>>1),r,1/c),c,c/11/d)),11111)).sin}
