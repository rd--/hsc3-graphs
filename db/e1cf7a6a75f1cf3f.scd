// MoogVCF
var voiceFunc = {
    arg e;
    var freq = e.p.unitCps;
    var osc = Mix.fill(8, { Saw.ar(freq * TExpRand.kr(0.99, 1.01, e.w)) });
    var amp = e.z * 2 * e.w.lagud(0.02, 4);
    MoogVCF.ar(osc, SinOsc.kr(e.y).exprange(freq * 2, freq * 4), e.rx) * amp };
Splay.ar(Voicer.ar(16, voiceFunc))
