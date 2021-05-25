// https://twitter.com/redFrik/status/456384156159574016
{var a = 1 / [3,12,4,1,6,2]
;var s = SinOsc.ar(freq: a, phase: 0).lag3(SinOsc.ar(freq: 2.67 ** a, phase: 0).abs) * 99
;var f = ((SinOsc.ar(freq: (1 / a) / 9, phase: a) > 0) * 20 + 99) / a
;Splay.ar(inArray: SinOsc.ar(freq: HPF.ar(in: Ringz.ar(in: s, freq: f, decaytime: 1), freq: 440), phase: 0)) * 0.25}

// https://twitter.com/redFrik/status/456384156159574016
{var a = 1 / [3,12,4,1,6,2]
;var s = SinOsc.ar(a).lag3(SinOsc.ar(2.67 ** a).abs) * 99
;var f = ((SinOsc.ar((1 / a) / 9,a) > 0) * 20 + 99) / a
;Splay.ar(SinOsc.ar(HPF.ar(Ringz.ar(s,f)))) * 0.25}
