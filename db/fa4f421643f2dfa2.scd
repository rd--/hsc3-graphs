// data space (jmcc) #2 ; graph rewrite
RTexture.overlapGraph({
    arg tr;
    var dt = TRand.kr(0, 0.25, tr) + 0.1;
    var osc = {
        arg n, m;
        var e = LFPulse.kr(TRand.kr(0, m, tr), 0, TRand.kr(0, 1, tr)) * TRand.kr(0, 8000, tr) + TRand.kr(0, 2000, tr);
        LFPulse.kr(TRand.kr(0, n, tr), 0, TRand.kr(0, 1, tr)) * e
    };
    var freq = osc.value(200, 40) + osc.value(20, 4) + osc.value(20, 4);
    CombL.ar(Pan2.ar(LFPulse.ar(freq, 0, 0.5), LFNoise0.kr(TRand.kr(0, 3, tr)) * 0.8, 0.04), dt, dt, 3)
}, 6, 1, 4)
