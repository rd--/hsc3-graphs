// pulse harmonic warbulence (jmcc) #12
var z = OverlapTexture({
    arg tr;
    var f = TRand.kr(24, 96, tr).midicps;
    var r = TxLine.kr(TExpRand.kr(0.1, 20, tr), TExpRand.kr(0.1, 20, tr), 25.6, tr);
    var n = 12;
    var p = LFPulse.kr(TExpRand.kr(0.2, 1.2, tr), TRand.kr(0.1, 0.2, tr), 0.5);
    Mix.arFill(n, {
        arg i;
        var m = (SinOsc.kr(r * TRand.kr(0.9, 1.1, tr), TRand.kr(0, 2 * pi, tr)) * 0.1 - 0.05).max(0);
        Pan2.ar(SinOsc.ar(f * i + f, 0) * m * (1 / (i + 1)), TRand.kr(-1, 1, tr), 1)
    }) * p
}, 12.8, 6.4, 6, 2);
Mix.arFill(5, { CombN.ar(z, 0.3, { Rand.ir(0.1, 0.3) }.dup, 8) }) * 0.5
