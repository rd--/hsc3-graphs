// https://sccode.org/1-5cZ ; bz (bernardo zitto) ; graph edit
OverlapTexture({
    arg tr;
    var n = 16;
    var amp = 0.5;
    var dist = TRand.kr(1, 2, tr);
    var dens = TRand.kr(12, 160, tr);
    var noisefreq = TRand.kr(1, 2, tr);
    var noisemul = TRand.kr(1, 2, tr);
    var noiseoffset = TRand.kr(-2, 0, tr);
    var frq1 = TRand.kr(100, 200, tr);
    var  frq2 = TRand.kr(200, 2500, tr);
    var rq1 = TRand.kr(0.1, 0.5, tr);
    var rq2 = TRand.kr(0.1, 0.5, tr);
    var sig = {
        var q = TRand.kr(rq1, rq2, tr);
        BPF.ar(
            Dust2.ar(dens) * (LFNoise1.ar(noisefreq) * noisemul + noiseoffset),
            TRand.kr(frq1, frq2, tr),
            q) / q.sqrt
    }.dup(n);
    Splay.ar((sig * dist).tanh * amp)
}, 4, 4, 4)
