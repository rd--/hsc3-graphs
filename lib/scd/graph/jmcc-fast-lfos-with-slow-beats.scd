// fast LFOs with slow beats
RTexture.overlapGraph({
    arg tr;
    var a0 = TRand.kr(40, 240, tr);
    var a1 = a0 + TRand.kr(-1, 1, tr);
    var a = [a0, a1];
    var b = TRand.kr(0, 2000, tr);
    var c = a + { TRand.kr(-1, 1, tr) }.dup;
    SinOsc.ar(SinOsc.ar(a, 0) * TRand.kr(0, 1, tr) * b + b, 0) * (SinOsc.kr(c, 0) * 0.05 + 0.05);
}, 8, 4, 4)
