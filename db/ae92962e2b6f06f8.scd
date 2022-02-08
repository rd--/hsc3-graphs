// chrd (rd) ; graph rewrite
RTexture.overlapGraph({
    arg tr;
    var chrd = {
        arg m;
        var ds = 3;
        var d = [5, 4, 5, 7, 4, 5] * ds;
        var f = TXLine.kr(m, m + TRand.kr(0.05, 0.5, tr), d, tr).midicps;
        var z = Env.sine(d.maxItem, TRand.kr(0.005, 0.01, tr));
        var e = EnvGen.kr(z, tr, 1, 0, 1, 0);
        var p = TXLine.kr(TRand.kr(-1, 1, tr), TRand.kr(-1, 1, tr), d, tr);
        var o = SinOsc.ar(f, 0);
        Mix.ar(Pan2.ar(o, p, e))
    };
    var scale = [0, 2, 4, 5, 7, 9, 11];
    var octaves = [4, 5, 6, 7];
    var mnn = scale.collect({ arg n; octaves.collect({ arg o; n + (o * 12) }) }).flatten;
    var chd = 6.collect({ TChoose.kr(tr, mnn) });
    Mix.fill(9, { chrd.value(chd) })
}, 21, 0, 3)
