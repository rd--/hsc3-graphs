// cfstring1 (jmcc) ; graph rewrite ; http://www.iamas.ac.jp/~aka/dspss2004/materials/
var nc = 2;
OverlapTexture({
    arg tr;
    var dgr = DegreeToKey.kr([0, 2, 4, 5, 7, 9, 11].asLocalBuf, TRand.kr(0, 12, tr), 12);
    var freq = (60 + dgr).midicps;
    var pan = TRand.kr(-0.25, 0.25, tr);
    var amp = TRand.kr(0.1, 0.2, tr);
    var fc = LinExp.kr(LFNoise1.kr(TRand.kr(0.25, 0.4, tr)), -1, 1, 500, 2000);
    var osc = { LFSaw.ar(freq * [TRand.kr(0.99, 1.01, tr), TRand.kr(0.99, 1.01, tr)], 0, amp) }.dup(8).sum.distort * 0.2;
    var eg = Decay2.kr(tr, 0.5, 1);
    var out = eg * RLPF.ar(osc, fc, 0.1);
    PanAz.ar(nc, out, [pan, pan + 0.3], 1, 2, 0.5).sum
}, 2, 0, 10)
