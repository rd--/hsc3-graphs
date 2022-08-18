// https://twitter.com/lukiss163/status/1559974704823341058
var f = { StandardN.ar((LFDNoise1.kr(1) * 8 + 8).roundTo(4)).abs };
var p = LFPulse.ar(f.value.exprange(4, 80).roundTo(1).midiCps.lag(0.05));
var w = LFSaw.kr(-8.dup(2) * f.value).exprange(100, f.value * 8000);
(LeakDC.ar(MoogFF.ar(p, w, LFDNoise1.kr(1, 2, 2).abs))).tanh

//---- https://twitter.com/lukiss163/status/1559974704823341058
l=LFDNoise1;tanh(ar(LeakDC,ar(MoogFF,ar(LFPulse,(f={ar(StandardN,kr(l,1,8,8).round(4)).abs}).value.exprange(4,80).round(1).midicps.lag(0.05)),kr(LFSaw,-8!2*f).exprange(100,f*8000),kr(l,1,2,2).abs)))
