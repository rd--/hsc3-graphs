// https://sccode.org/1-4Qy ; f0 ; 0279
var b = [1, 3, 6, 8, 10];
var m = DegreeToKey.ar(b.asLocalBuf, LFSaw.ar(LFSaw.ar(1 / b / 99, 0) / pi, 0) * 12 + 18 + b, 12);
var f = CombN.ar(m.midiCps, 0.2, 0.2, 1);
Splay2.ar(LFSaw.ar(f, 0)) * 0.6

//----tweet0279
a=LFSaw;Splay ar:a.ar(CombN ar:DegreeToKey.ar(as(b=[1,3,6,8,10],LocalBuf),a.ar(a.ar(1/b/99)/pi)*12+18+b).midicps)*0.6
