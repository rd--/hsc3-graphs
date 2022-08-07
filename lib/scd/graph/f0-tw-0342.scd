// https://sccode.org/1-4Qy ; f0 ; 0342
var b = 1.to(8) / 128;
var c = LFSaw.ar(b, 0) % 1;
var f = (2 ** LFSaw.ar(b, 0) * 256).roundTo(64);
var e = RLPF.ar(LFSaw.ar(1 / b / 32, 0), 500, 1.01 - c);
var o = SinOscFB.ar(f, c) * e;
Splay2.ar(Clip(o, 0, 1) / 2)

//--tweet0342
a=LFSaw;Splay ar:SinOscFB.ar(round(2**a.ar(b=(1..8)/128)*256,64),c=a.ar(b)%1,RLPF.ar(a.ar(1/b/32),500,1.01-c)).clip/2
