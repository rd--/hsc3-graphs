// https://twitter.com/redFrik/status/456384156159574016
{var a = 1 / [3,12,4,1,6,2]
;var s = SinOsc.ar(a).lag3(SinOsc.ar(2.67 ** a).abs) * 99
;var f = ((SinOsc.ar((1 / a) / 9,a) > 0) * 20 + 99) / a
;Splay.ar(SinOsc.ar(HPF.ar(Ringz.ar(s,f)))) * 0.25}

