// https://sccode.org/1-4Qy ; f0 ; 0251
var b = 1.to(8);
var o = (SyncSaw.ar(99 * b, b * 2.01) % SyncSaw.ar(b / 64, SyncSaw.ar([4, 8, 14], b / 4) + 1).max(0)).sum;
GVerb.ar(Limiter.ar(HPF.ar(o, 9), 1, 0.01) / 2, 70, 4, 0.5, 0.5, 15, 1, 0.7, 0.5, 300)

//----tweet0251
a=SyncSaw;GVerb.ar(Limiter.ar(HPF.ar(Mix(a.ar(99*b=(1..8),b*2.01)%a.ar(b/64,a.ar([4,8,14],b/4)+1).max(0)),9))/2,70,4)
