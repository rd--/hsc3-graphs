// https://twitter.com/redFrik/status/1125557217086857216

{var scl = Scale.yu(Tuning.pythagorean).semitones
;var a = LFTri
;var b = (-7..6) + 0.7 * 2/666
;var m = kr(DegreeToKey,LocalBuf.newFrom(scl),kr(a,b,b) * kr(a,b,0) * 9 + 9 % 32,12) + 24
;var o = ar(VarSaw,m.midicps,0,kr(a,b,0) + 1 / 2) * kr(AmpComp,m) * kr(a,b,b) * b * 9
;var s = ar(RLPF,o,m.lag2(1/b%1) * 3)
;ar(Splay,ar(AllpassN,s,0.3,0.2 - b,3)).tanh}.play
