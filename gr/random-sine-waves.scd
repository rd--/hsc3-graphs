"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~rsw = {
	var o = FSinOsc.ar(2000.0.rand) * 0.02;
	Pan2.ar(o,1.0.rand2);
}

~overlap_texture.(~rsw,susdur:2,transdur:5,overlaps:12);

~rsw.play
