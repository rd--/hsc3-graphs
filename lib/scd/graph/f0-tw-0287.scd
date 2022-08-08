// https://sccode.org/1-4Qy ; f0 ; 0287
var o = Saw.ar((':>AEH.'.ascii - (2 ** LFSaw.ar(1.to(5) / 32)).ceil).midiCps);
var e = o % LFSaw.ar([1, 1, 6]) % LFSaw.ar(2, [1, 2] / 8, 2);
HPF.ar(Splay2.ar(e), 9) / 2

//--tweet0287
a=LFSaw;HPF.ar(Splay.ar(Saw.ar(midicps(':>AEH.'.ascii-ceil(2**a.ar((1..5)/32))))%a.ar(1!2++6)%a.ar(2,[1,2]/8,2)),9)/2
