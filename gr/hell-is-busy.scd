~hib = {
	var o = FSinOsc.ar(400+2000.0.rand,0,LFPulse.kr(1+10.0.rand,0,0.7.rand,0.04));
	Pan2.ar(o,1.0.rand2);
}

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({~hib},susdur:4,transdur:4,overlaps:8);
