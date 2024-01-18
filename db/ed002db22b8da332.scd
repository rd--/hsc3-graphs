// https://twitter.com/lukiss163/status/1559974704823341058
var f = { StandardN.ar((LFDNoise1.kr(1) * 8 + 8).round(4)).abs };
var p = LFPulse.ar(f.value.exprange(4, 80).round(1).midicps.lag(0.05));
var w = LFSaw.kr(-8.dup(2) * f.value).exprange(100, f.value * 8000);
(LeakDC.ar(MoogFF.ar(p, w, LFDNoise1.kr(1, 2, 2).abs))).tanh
