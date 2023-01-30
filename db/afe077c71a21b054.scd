// hell is busy (jmcc) #1 ; graph rewrite
OverlapTexture({
    arg tr;
    var e = LFPulse.kr(TRand.kr(1, 11, tr), 0, TRand.kr(0, 0.7, tr)) * 0.04; // amplitude envelope
    Pan2.ar(FSinOsc.ar(TRand.kr(400, 2400, tr), 0) * e, TRand.kr(-1, 1, tr))
}, 4, 4, 8)
