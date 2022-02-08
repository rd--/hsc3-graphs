// tank (jmcc)
var pling = {
    var d = Dust.ar(0.2);
    var f = ExpRand.ir(300, 2200);
    var p = Rand.ir(-1, 1);
    var s1 = FSinOsc.ar(f, 0).cubed;
    var s2 = Decay2.ar(d, 0.1, 0.5) * 0.1 * s1;
    Pan2.ar(s2, p, 1)
};
var bang = {
    var d = Dust.ar(0.01);
    var n = BrownNoise.ar();
    Pan2.ar(Decay2.ar(d, 0.04, 0.3) * n, 0, 1)
};
var tank = {
    arg i;
    var r1 = { Rand.ir(0.01,0.05) }.dup;
    var r2 = { Rand.ir(0.03,0.15) }.dup;
    var l0 = LocalIn.ar(2, 0) * 0.98;
    var l1 = OnePole.ar(l0, 0.33);
    var l2 = Rotate2.ar(l1.first, l1.second, 0.23);
    var l3 = AllpassN.ar(l2, 0.05, r1, 2);
    var l4 = DelayN.ar(l3, 0.3, #[0.17, 0.23]);
    var l5 = AllpassN.ar(l4, 0.05, r2, 2);
    var l6 = LeakDC.ar(l5, 0.995);
    var l7 = l6 + i;
    LocalOut.ar(l7);
    l7
};
var z = Mix.fill(12, pling) + bang.value;
4.do({ z = AllpassN.ar(z, 0.03, { Rand.ir(0.005, 0.02) }.dup, 1) });
tank.value(z)
