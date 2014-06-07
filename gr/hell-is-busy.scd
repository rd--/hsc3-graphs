"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~hib = {
	var e = LFPulse.kr(1+10.0.rand,0,0.7.rand,0.04);
	var o = FSinOsc.ar(400+2000.0.rand,0,e);
	Pan2.ar(o,1.0.rand2);
}

~overlap_texture.(~hib,susdur:4,transdur:4,overlaps:8);

~overlap_texture.({
    var n = 8; /* number of simultaneous events */
	var e = LFPulse.kr(1+10.0.rand, 0, 0.7.rand, 0.04); /* amplitude envelope */
    Pan2.ar(FSinOsc.ar(400+2000.0.rand, 0, e),1.0.rand2)
}, 4, 4, 8)
