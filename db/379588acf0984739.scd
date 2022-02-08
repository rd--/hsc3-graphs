// drummer (tm)
var tempo = 4;
var n = WhiteNoise.ar();
var tr1 = Impulse.ar(tempo, 0);
var tr2 = PulseDivider.ar(tr1, 4, 2);
var tr4 = PulseDivider.ar(tr1, 4, 0);
var snare = n * Decay2.ar(tr2, 0.005, 0.5);
var bass = SinOsc.ar(60, 0) * Decay2.ar(tr4, 0.005, 0.5);
var hihat = HPF.ar(n, 10000) * Decay2.ar(tr1, 0.005, 0.5);
Pan2.ar(snare + bass + hihat, 0, 0.1)
