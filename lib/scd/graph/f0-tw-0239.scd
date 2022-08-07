// https://sccode.org/1-4Qy ; f0 ; 0239
var b = 0.11 / 1.to(6);
var q = " #SuperCollider ".as(Array).collect('asciiValue'); // https://github.com/supercollider/supercollider/issues/5658
var o = LFTri.ar(Duty.ar(b, 0, Dseq(q.midiCps, inf)), 0);
Splay2.ar(CombC.ar(o, 4, LFTri.ar(b / 9, 0) % LFTri.ar(b, 0) * 4 % 4, 5) / 6).tanh

//--tweet0239
a=LFTri;Splay.ar(CombC.ar(a.ar(Duty.ar(b=0.11/(1..6),0,Dseq(" #SuperCollider ".ascii.midicps,inf))),4,a.ar(b/9)%a.ar(b)*4%4,5)/6).tanh
