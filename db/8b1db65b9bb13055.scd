// random impulses ; https://github.com/cianoc/supercollider_fragments
var f = {
    var freq = 100.exprand(3000);
    var amp = EnvGen.kr(Env.perc(0, (freq ** -0.7) * 100, 1, #[-4]), Dust.kr(1 / 5));
    Pan2.ar(SinOsc.ar(freq * (LFNoise1.kr(1 / 6) * 0.4 + 1), 0) * amp, LFNoise1.kr(1 / 8), 1) };
Mix.fill(15, f) * 0.1
