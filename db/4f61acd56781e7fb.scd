// https://twitter.com/redFrik/status/1590835403157688320
play{ar(Splay,7**ar(a=SinOsc,g=1/(b=(1..9))/99)/9*ar(a,999*b.scramble/ar(f=RLPF,ar(c=Latch,round(ar(d=WhiteNoise),0.5)+2,ar(e=BrownNoise)+1.4>ar(a,b/999)),9**ar(a,g*9)*999,ar(a,b/77)/2+0.6))*ar(f,ar(c,ar(d),ar(e)+1.3>ar(a,b/99)),9**ar(a,g)*999,ar(a,b/88)/2+0.6))}
