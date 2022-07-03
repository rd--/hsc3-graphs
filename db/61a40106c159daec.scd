// noise modulated sines (jmcc) #6 ; graph rewrite
var z = Texture.overlapGraph({
    arg tr;
    var f = TRand.kr(60, 100, tr).midicps;
    FSinOsc.ar([f, f + 0.2], 0) * LFNoise2.kr(f * [0.15, 0.16]) * 0.05
}, 4, 4, 4);
CombN.ar(z, 0.3, 0.3, 4) + z.reverse
