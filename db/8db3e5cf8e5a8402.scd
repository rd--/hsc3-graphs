// https://sonomu.club/@lukiss/109545370818142871
var l = { LFNoise2.ar(3 ! 6) / 99 + 2 };
var f = Demand.ar(Dust.ar(2 * l.value.frac), 0, Dseq((1, 3 .. 38).degreeToKey(Scale.aeolian), inf)).midicps;
var o = DelayC.ar(LeakDC.ar(LocalIn.ar(1, 0) + Dust.ar(1), 0.995), 1, { |n| 2 ** n } ! 6 * l.value / f);
Splay.ar(LPZ2.ar(o) / 5) <! LocalOut.ar(o.sum.softclip)
