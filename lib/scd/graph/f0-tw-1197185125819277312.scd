// https://twitter.com/redFrik/status/1197185125819277312
{var a = SinOsc
;var f = [2,2.2]
;var e = f/22
;var g = g = 2<<2
;var t = ToggleFF
;var p = LFPulse
;var c = ar(RHPF,ar(CombN,ar(a,e)/2*ar(LocalIn,2),2,2,g),[22,2]*222,e*2)
;var o = ar(a,2.2**ar(t,ar(p,2,[2.2,2],e))*22*2.22,ar(t,c-e).lag*g)*ar(p,2,f)
;var d = ar(Splay,ar(RLPF,o,g**ar(a,e/2/2)*2222/2,ar(a,e)+2/2pi)+c).tanh
;ar(LocalOut,d)
;d * 0.25}
