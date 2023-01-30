// jmcc - ostinoodles
var f = {
    arg tr;
    var sequ = { arg s, tr; Demand.kr(tr, 0, Dseq.dr(s, inf)) };
    var root = 81 + TRand.kr(-6, 6, tr);
    var major = #[0, 2, 4, 5, 7, 9, 11].as(LocalBuf);
    var offset = TRand.kr(-16, 16, tr);
    var sequence = DegreeToKey.kr(major, TScramble.kr(tr, [0, 1, 2, 3] + offset), 12) + root;
    var f = TxLine.kr(TExpRand.kr(4.0, 24.0, tr), TExpRand.kr(4.0, 24.0, tr), 12, tr);
    var trig = Impulse.kr(f, 0);
    var freq = sequ.value(sequence.midicps, trig);
    var sig = LFTri.ar(freq, 0) * Decay2.kr(trig, 0.004, 0.3) * 0.1;
    Pan2.ar(sig, TRand.kr(-1, 1, tr), 1) };
var z = OverlapTexture(f, 6, 3, 6);
6.do({ z = AllpassN.ar(z, 0.040, { Rand.ir(0, 0.040) }.dup, 16) });
z
