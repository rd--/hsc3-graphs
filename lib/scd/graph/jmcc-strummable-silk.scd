// strummable silk (jmcc) #11
var mousex = MouseX.kr(0, 1, 0, 0.2);
var str = {
    arg i;
    var n = 15;
    var trigger = HPZ1.kr(mousex > (0.25 + (i * 0.07))).abs;
    var pluck = PinkNoise.ar(Decay.ar(Impulse.ar(14, 0) * Lag.kr(Trig.kr(trigger, 1), 0.2) * 0.01, 0.04));
    var freq = ([-2, 0, 3, 5, 7, 10, 12, 15].at(i - 1) + 60).midicps;
    var metal = RingzBank.ar(pluck, Array.fill(n, { arg j; (j + 1) * freq } ), nil, Array.fill(n, { 0.3.rrand(1.0) }));
    Pan2.ar(metal, i * 0.2 - 0.5, 1)
};
var out = LeakDC.ar(LPF.ar((1 .. 8).collect(str).sum, 12000));
out = LeakDC.ar(LPF.ar(out, 12000));
6.do({out = AllpassN.ar(out, 0.1, [0.05.rand, 0.05.rand], 4)}); // rvb
out

// strummable silk (jmcc) #11 ; klank
var mousex = MouseX.kr(0, 1, 0, 0.2);
var str = {
    arg i;
    var n = 15;
    var trigger = HPZ1.kr(mousex > (0.25 + (i * 0.07))).abs;
    var pluck = PinkNoise.ar(Decay.ar(Impulse.ar(14, 0) * Lag.kr(Trig.kr(trigger, 1), 0.2, 0.01), 0.04));
    var freq = ([-2, 0, 3, 5, 7, 10, 12, 15].at(i - 1) + 60).midicps;
    var z = [Array.fill(n, { arg j; (j + 1) * freq } ), nil, Array.fill(n, { 0.3.rrand(1.0) })];
    var metal = Klank.ar(Ref.new(z), pluck);
    Pan2.ar(metal, i * 0.2 - 0.5)
};
var out = LeakDC.ar(LPF.ar((1 .. 8).collect(str).sum, 12000));
out = LeakDC.ar(LPF.ar(out, 12000));
6.do({out = AllpassN.ar(out, 0.1, [0.05.rand, 0.05.rand], 4)}); // rvb
out
