// deepsea (jrhb)
var amp = 0.1;
var variation = 0.9;
var tr = Dust.kr(0.2);
var pan = TRand.kr(-1, 1, tr);
var n = TRand.kr(7, 46, tr);
var dt1 = 25.0 + TRand.kr(-1.7, 1.7, tr);
var dt2 = dt1 + LFNoise2.kr(2) * variation * 0.001;
var freq = 901 + TRand.kr(0, 65, tr);
var t = Impulse.ar(dt2.reciprocal, 0) * 100;
var count = PulseCount.ar(t, tr);
var mul = count < n;
var u1 = BPF.ar(mul * t, freq, 0.1);
var u2 = BPF.ar(u1, freq * (count % LFNoise1.kr(1).range(2, 20) + 1), 0.2);
var o = Pan2.ar(u2, pan, amp * 10);
var f1 = BPF.ar(o * 5, 700, 0.1);
var f2 = CombL.ar(LPF.ar(f1 * LFNoise1.kr(0.1).max(0), 800), 0.5, 0.5, 1) + f1.reverse;
var f3 = f2;
5.do({ f3 = AllpassN.ar(f3, 0.18, { Rand.ir(0, 0.06) }.dup(2) + 0.06, 8) });
LPF.ar(f2 + f3, 400) + (LFNoise1.kr(0.2) * f2)
