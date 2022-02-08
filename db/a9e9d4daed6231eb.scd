// forest sounds (pj)
var insects = {
    var n1 = BrownNoise.ar;
    var n2 = LFNoise2.kr(50);
    var o = SinOsc.kr(n2 * 50 + 50, 0) * 100 + 2000;
    BPF.ar(n1, o, 0.001) * 10
};
Array.fill(2, insects)
