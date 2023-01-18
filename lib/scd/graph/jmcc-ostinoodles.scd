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

//---- jmcc - ostinoodles ; keywords
var z = OverlapTexture({
    arg tr;
    var sequ = { arg s, tr; Demand.kr(trig: tr, reset: 0, demandUGens: Dseq.dr(s, inf)) };
    var root = 81 + TRand.kr(lo: -6, hi: 6, trig: tr);
    var major = [0, 2, 4, 5, 7, 9, 11].as(LocalBuf);
    var offset = TRand.kr(lo: -16, hi: 16, trig: tr);
    var sequence = DegreeToKey.kr(bufnum: major, in: TScramble.kr(trigger: tr, inputs: [0, 1, 2, 3] + offset), octave: 12) + root;
    var f = TxLine.kr(start: TExpRand.kr(lo: 4.0, hi: 24.0, trig: tr), end: TExpRand.kr(lo: 4.0, hi: 24.0, trig: tr), dur: 12, trig: tr);
    var trig = Impulse.kr(freq: f);
    var freq = sequ.value(sequence.midicps, trig);
    var sig = LFTri.ar(freq: freq, iphase: 0, mul: Decay2.kr(in: trig, attackTime: 0.004, decayTime: 0.3, mul: 0.1));
    Pan2.ar(in: sig, pos: TRand.kr(lo: -1, hi: 1, trig: tr), level: 1)}, 6, 3, 6);
6.do({ z = AllpassN.ar(in: z, maxdelaytime: 0.040, delaytime: [Rand.ir(lo: 0, hi: 0.040),Rand.ir(lo: 0, hi: 0.040)], decaytime: 16) });
z
