// https://twitter.com/redFrik/status/1125557217086857216
var scl = Scale.yu(Tuning.at(\pythagorean)).semitones;
var a = LFTri;
var b = (-7 .. 6) + 0.7 * 2 / 666;
var m = DegreeToKey.kr(LocalBuf.newFrom(scl),a.kr(b,b) * a.kr(b,0) * 9 + 9 % 32,12) + 24;
var o = VarSaw.ar(m.midicps,0,a.kr(b,0) + 1 / 2) * AmpComp.kr(m) * a.kr(b,b) * b * 9;
var s = RLPF.ar(o,m.lag2(1 / b % 1) * 3);
Splay.ar(AllpassN.ar(s,0.3,0.2 - b,3)).tanh

// ---- https://twitter.com/redFrik/status/1125557217086857216
{ar(Splay,ar(AllpassN,ar(RLPF,ar(VarSaw,f=kr(DegreeToKey,LocalBuf.newFrom(Scale.yu(Tuning.pythagorean).semitones),kr(a=LFTri,b=(-7..6)+0.7*2/666,b,kr(a,b))*9+9%32,12,1,24).midicps,0,kr(a,b)+1/2,kr(AmpComp,f)*kr(a,b,b)*b*9),f.lag2(1/b%1)*3),0.3,0.2-b,3)).tanh}

// ---- calculations
(-7..6) == (14.iota - 7) // iota
