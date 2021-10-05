// f0 ; https://twitter.com/redFrik/status/1210118661022867458
{var b = (6.iota + 2).reciprocal
;var d = $0.ascii.reciprocal
;var g = 0.cos.cos
;var f = Duty.ar(dur: b, reset: 0, level: Dseq.dr(list: "0 0 00 0 0 000  _0 0 0 00 00 00000+  !".ascii, repeats: inf), doneAction: 0)
;var o = SinOscFB.ar(freq: f, feedback: SinOsc.ar(freq: d, phase: 0).max(0) * 0.cos.sin)
;var c = SinOsc.ar(freq: 0, phase: pi ** o)
;var p = PitchShift.ar(in: c, windowSize: g, pitchRatio: b.reciprocal, pitchDispersion: d, timeDispersion: d, mul: b)
;LeakDC.ar(in: Splay.ar(inArray: c + p), coef: 0.995) * g}

//---- f0 ; https://twitter.com/redFrik/status/1210118661022867458
{c=ar(e=SinOsc,0,pi**ar(SinOscFB,ar(Duty,b=("00".size.."0000000".size).reciprocal,0,Dseq("0 0 00 0 0 000  _0 0 0 00 00 00000+  !".ascii,inf)),ar(e,d=$0.ascii.reciprocal).max*0.cos.sin));ar(LeakDC,ar(Splay,c+ar(PitchShift,c,e=0.cos.cos,b.reciprocal,d,d,b)))*e}

//---- calculations
("00".size.."0000000".size) == (2..7)
(6.iota + 2) == (2 .. 7)
$0.ascii == 48
"0 0 00 0 0 000  _0 0 0 00 00 00000+  !".ascii
