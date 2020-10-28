// https://twitter.com/redFrik/status/1210118661022867458

play{c=ar(e=SinOsc,0,pi**ar(SinOscFB,ar(Duty,b=("00".size.."0000000".size).reciprocal,0,Dseq("0 0 00 0 0 000  _0 0 0 00 00 00000+  !".ascii,inf)),ar(e,d=$0.ascii.reciprocal).max*0.cos.sin));ar(LeakDC,ar(Splay,c+ar(PitchShift,c,e=0.cos.cos,b.reciprocal,d,d,b)))*e}

play
{var e=SinOsc
;var b = ("00".size.."0000000".size).reciprocal
;var d = $0.ascii.reciprocal
;var g = 0.cos.cos
;var f = ar(Duty,b,0,Dseq("0 0 00 0 0 000  _0 0 0 00 00 00000+  !".ascii,inf))
;var o = ar(SinOscFB,f,ar(e,d).max*0.cos.sin)
;var c = ar(e,0,pi**o)
;ar(LeakDC,ar(Splay,c+ar(PitchShift,c,g,b.reciprocal,d,d,b)))*g}
