// uplink (jmcc)

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
	var osc = {LFPulse.kr(20.0.rand, 0, 1.0.rand, LFPulse.kr(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand))};
	var freq = osc.() + osc.();
	Pan2.ar( LFPulse.ar(freq, 0, 0.5, 0.04), 0.8.rand2)
}, 4, 1, 5);
