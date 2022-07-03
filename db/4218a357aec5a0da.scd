// noise modulated sawtooths (jmcc) #6
var a = Texture.overlapGraph({
    arg tr;
    var f = TRand.kr(60, 100, tr).midicps;
    LFSaw.ar([f, f + 0.2], 0) * LFNoise2.kr(f * [0.15, 0.16]) * 0.05
}, 4, 4, 4);
CombN.ar(a, 0.5, 0.5, 4) + a.reverse
