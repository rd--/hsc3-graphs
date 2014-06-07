"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~data_space = {
	var dtime = 0.25.rand + 0.1;
	var freq = LFPulse.kr(200.0.rand, 0, 1.0.rand, LFPulse.kr(40.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand));
	freq = freq + LFPulse.kr(20.0.rand, 0, 1.0.rand, LFPulse.kr(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand));
	freq = freq + LFPulse.kr(20.0.rand, 0, 1.0.rand, LFPulse.kr(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand));
	CombL.ar(Pan2.ar( LFPulse.ar(freq, 0, 0.5, 0.04), LFNoise0.kr(3.0.rand, 0.8)), dtime, dtime, 3);
}

~overlap_texture.({~data_space},susdur:6,transdur:1,overlaps:4);
