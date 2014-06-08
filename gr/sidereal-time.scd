"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~sidereal_time = {
	var p = 15;
	var z = Array.fill(2,{`[Array.fill(p,{exprand(100.0,6000.0)}),
		nil,
		Array.fill(p,{2.0 + 4.0.rand})]});
	var f = XLine.kr(exprand(40.0,300.0),exprand(40.0,300.0),12);
	var t = LFPulse.ar(f,0,rrand(0.1,0.9),0.002 * LFNoise2.kr(8.0.rand).max(0));
	Klank.ar(z,t).distort * 0.1;
};
~overlap_texture.(~sidereal_time,sustainTime:4,transitionTime:4,overlap:6);
~post_process.({arg z; CombN.ar(z,0.6,0.5.rand + 0.1,8,1,z.reverse)});
