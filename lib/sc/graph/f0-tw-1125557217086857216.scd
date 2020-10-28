// https://twitter.com/redFrik/status/1125557217086857216

play{ar(Splay,ar(AllpassN,ar(RLPF,ar(VarSaw,f=kr(DegreeToKey,LocalBuf.newFrom(Scale.yu(Tuning.pythagorean).semitones),kr(a=LFTri,b=(-7..6)+0.7*2/666,b,kr(a,b))*9+9%32,12,1,24).midicps,0,kr(a,b)+1/2,kr(AmpComp,f)*kr(a,b,b)*b*9),f.lag2(1/b%1)*3),0.3,0.2-b,3)).tanh}

{var scl = semitones(yu(Scale,at(Tuning,\pythagorean)))
;var a = LFTri
;var b = (-7..6) + 0.7 * 2 / 666
;var m = kr(DegreeToKey,newFrom(LocalBuf,scl),kr(a,b,b) * kr(a,b,0) * 9 + 9 % 32,12) + 24
;var o = ar(VarSaw,midicps(m),0,kr(a,b,0) + 1 / 2) * kr(AmpComp,m) * kr(a,b,b) * b * 9
;var s = ar(RLPF,o,lag2(m,1 / b % 1) * 3)
;tanh(ar(Splay,ar(AllpassN,s,0.3,0.2 - b,3)))}.play
