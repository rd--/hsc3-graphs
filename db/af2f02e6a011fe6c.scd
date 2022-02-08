// DynKlank
var tr = Dust.kr(25);
var spec = Ref.new([(1..5) * 2700, TRand.kr(0.025, 0.04, tr.dup(5)), 0.1.dup(5)]);
var k = DynKlank.ar(spec, Trig.ar(tr, SampleDur.ir), 1, 0, 1);
var n = k + (BrownNoise.ar * 0.075 * Trig.kr(tr, TRand.kr(0.01, 0.03, tr)));
var f = LPF.ar(HPF.ar(n, TRand.kr(6000, 7500, tr).lag(0.01)), TRand.kr(4000, 5500, tr).lag(0.01));
Pan2.ar(f, TRand.kr(-0.5, 0.5, tr).lag(0.01), 1)
