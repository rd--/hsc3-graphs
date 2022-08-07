// https://sccode.org/1-4Qy ; f0 ; 0250
var o = LFSaw.ar(Latch.ar(LFSaw.ar(1.50055, [0, 0.0005].dup(2)), LFSaw.ar([15, 4, 2], 0)) * [999, 400, 150]).sum;
AllpassC.ar(o / 4, 3, 2 - LFSaw.ar(0.1, [0, 1]), 1)

//----tweet0250
a=LFSaw;AllpassC.ar(Mix(a.ar(Latch.ar(a.ar(1.50055,[0,5e-4]!2),a.ar([15,4,2]))*[999,400,150]))/4,3,2-a.ar(0.1,[0,1]))
