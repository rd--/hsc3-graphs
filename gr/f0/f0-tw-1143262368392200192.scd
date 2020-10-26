// https://twitter.com/redFrik/status/1143262368392200192

play{ar(Splay,ar(RLPF,ar(a=VarSaw,ar(a,(c=4/4/4)/4,c,c).max*4+44,4,ar(a,[4,4/44,c*4]).abs),44*44,c)*ar(Line,dur:4)+ar(PitchShift,ar(CombC,b=ar(a,f=ar(a,d=c*4/44.4,c,-4.sin,4).max.ceil*44+44,4,ar(a,[44-4,4,44+4]/4.44))/4,c,c*4/f+d),4-c,[4+4+4,4*4,4+4],c,c,c+c))/4}

play
{var a = VarSaw
;var c = 4/4/4
;var d = c*4/44.4
;var f = ar(a,d,c,-4.sin,4).max.ceil*44+44
;var b = ar(a,f,4,ar(a,[44-4,4,44+4]/4.44))/4
;var o = ar(RLPF,ar(a,ar(a,c/4,c,c).max*4+44,4,ar(a,[4,4/44,c*4]).abs),44*44,c)
;ar(Splay,o*ar(Line,dur:4)+ar(PitchShift,ar(CombC,b,c,c*4/f+d),4-c,[4+4+4,4*4,4+4],c,c,c+c))/4}
