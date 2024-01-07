// Ostinoodles ; Jmcc ; graph rewrite (Rd)
var z = OverlapTexture({ |tr|
    var root = 81 + TRand.kr(-6, 6, tr);
    var major = [0, 2, 4, 5, 7, 9, 11].as(LocalBuf);
    var offset = TRand.kr(-16, 16, tr);
    var sequence = DegreeToKey.kr(major, TScramble.kr(tr, [0, 1, 2, 3] + offset), 12) + root;
    var trig = Impulse.kr(TxLine.kr(TExpRand.kr(4, 24, tr), TExpRand.kr(4, 24, tr), 12, tr), 0);
    var freq = Sequencer.kr(sequence.midicps, trig);
    var sig = LFTri.ar(freq, 0) * Decay2.kr(trig, 0.004, 0.3) * 0.1;
    Pan2.ar(sig, TRand.kr(-1, 1, tr), 1)
}, 6, 3, 6);
6.do {
	z = AllpassN.ar(z, 0.04, { Rand.ir(0, 0.04) }.dup, 16)
};
z
