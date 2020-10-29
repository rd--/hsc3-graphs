// drummer (tm)
{var tempo = 4
;var n = WhiteNoise.ar
;var tr = Impulse.ar(tempo, 0)
;var tr_2 = PulseDivider.ar(tr, 4, 2)
;var tr_4 = PulseDivider.ar(tr, 4, 0)
;var snare = n * Decay2.ar(tr_2, 0.005, 0.5)
;var bass = SinOsc.ar(60, 0) * Decay2.ar(tr_4, 0.005, 0.5)
;var hihat = HPF.ar(n, 10000) * Decay2.ar(tr, 0.005, 0.5)
;Out.ar(0, Pan2.ar(snare + bass + hihat, 0, 0.4))}
