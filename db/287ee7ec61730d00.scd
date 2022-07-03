// pond life (jmcc) #1 ; graph rewrite
Texture.overlapGraph({
    arg tr;
    var f = FSinOsc.kr(TRand.kr(20, 50, tr), 0) * TRand.kr(100, 400, tr) + TLinRand.kr(500, 2500, 0, tr);
    var o = SinOsc.ar(f, 0) * LFPulse.kr(3 / TRand.kr(1, 9, tr), 0, TRand.kr(0.2, 0.5, tr)) * 0.04;
    Pan2.ar(o, TRand.kr(-1, 1, tr), 1)
}, 8, 8, 4)
