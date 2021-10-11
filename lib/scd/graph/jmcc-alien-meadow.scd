// alien meadow (jmcc) #6
RTexture.overlapGraph({
    arg tr;
    var z = TRand.kr(0, 5000, tr);
    var f = SinOsc.ar(TRand.kr(0, 20, tr), 0) * (0.1 * z) + z;
    var a = SinOsc.kr(TRand.kr(0, 20, tr), 0) * 0.05 + 0.05;
    Pan2.ar(SinOsc.ar(f, 0), TRand.kr(-1, 1, tr), a)
}, 6, 2, 6)
