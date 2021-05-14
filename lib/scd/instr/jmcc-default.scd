// default (jmcc)
SynthDef(\default, {
    arg out=0,freq=440,amp=0.1,pan=0,gate=1;
    var e = Linen.kr(gate, 0.01, 0.7, 0.3, 2);
    var f3 = freq + [0, Rand(-0.4,0.0), Rand(0.0,0.4)];
    var l = XLine.kr(Rand(4000,5000), Rand(2500,3200), 1);
    var z = LPF.ar(Mix(VarSaw.ar(f3, 0, 0.3, 0.3)),l) * e;
    OffsetOut.ar(out, Pan2.ar(z, pan, amp));
},[\ir]).add;

Pbind(\note,Pseq([1,2,3],1)).play;
