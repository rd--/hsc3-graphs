"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~string_wander_cluster = {
	var note = 50 + 50.rand;
	var note_ = (note + 15.rand - 7).fold(50,120);
	var delay = 1/note_.midicps;
	Pan2.ar(CombC.ar(WhiteNoise.ar(0.008), 0.01, delay, delay * 1000), 1.0.rand2)
};
~overlap_texture.(~string_wander_cluster,sustainTime:4/3,transitionTime:4/3,overlap:6);
