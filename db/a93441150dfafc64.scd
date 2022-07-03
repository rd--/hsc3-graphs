// clipped inharmonic warbulence ; jmcc
var z = Texture.overlapGraph({
    arg tr;
    var r = LinExp.kr(LFNoise1.kr(1 / 16), -1, 1, 0.1, 20);
    var f = TRand.kr(24, 96, tr).midicps;
    var a = 1.min(500 / f);
    var n = 12;
    a * Mix.arFill(n, {
        arg i;
        var g = TRand.kr(0, n, tr) + 1;
        var o = (SinOsc.ar(f * g, 0) * (SinOsc.kr(r * TRand.kr(0.9, 1.1, tr), TRand.kr(0, 2 * pi, tr)) * 0.08 - 0.04).max(0)).max(0);
        Pan2.ar(o, TRand.kr(-1, 1, tr), 2 / g)
    });
}, 12.8, 6.4, 6);
z = LeakDC.ar(z, 0.995);
Mix.arFill(8, { CombN.ar(z, 0.3, { Rand.ir(0.1, 0.3) }.dup, 20) }) * 0.2
