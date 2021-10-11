// blips 001 (jmcc) #SC3d1.5 ; graph rewrite
var z = RTexture.overlapGraph({
    arg tr;
    var blip_f = {
        var f = RTXLine.kr(TExpRand.kr(0.25, 400, tr), TExpRand.kr(0.25, 400, tr), 4, tr);
        var nh = RTXLine.kr(TExpRand.kr(2, 100, tr), TExpRand.kr(2, 100, tr), 4, tr);
        Blip.ar(f, nh)
    };
    Pan2.ar(blip_f.value * blip_f.value, Line.kr(TRand.kr(-1, 1, tr), TRand.kr(-1, 1, tr), 4), 0.3)
}, 2, 1, 12);
z = z.distort;
6.do({ z = AllpassN.ar(z, 0.05, { Rand(0, 0.05) }.dup, 4) });
z
