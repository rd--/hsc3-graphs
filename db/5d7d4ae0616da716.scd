// ostinoodles ; graph rewrite
var z = Texture.overlapGraph({
        arg tr;
		var sequ, major, root, f, offset, sequence, trig;
        sequ = {arg s, tr; Demand.kr(tr, 0, Dseq(s, inf))};
        root = 81 + TRand.kr(-6,6,tr);
        major = [0, 2, 4, 5, 7, 9, 11].as(LocalBuf);
		offset = TRand.kr(-16,16,tr);
		sequence = (DegreeToKey.kr(major,TScramble.kr(tr,[0, 1, 2, 3] + offset)) + root).midicps;
		trig = Impulse.kr(LinExp.kr(Sweep.kr(tr,1/12),0,1,TExpRand.kr(4.0, 24.0, tr), TExpRand.kr(4.0, 24.0, tr)));
		f = sequ.value(sequence, trig);
		Pan2.ar(
			LFTri.ar(f, 0, Decay2.kr(trig, 0.004, 0.3, 0.1)),
			TRand.kr(-1,1,tr)
		)}, 6, 3, 6, 2);
6.do({
    z = AllpassN.ar(z, 0.040, [0.040.rand,0.040.rand], 16)
});
z
