"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({{
    var env = Env.linen(2, 5, 2, 0.02);
    var o1 = FSinOsc.ar(2000.0.rand, 0, EnvGen.kr(env));
    var o2 = SinOsc.ar(8+80.0.linrand, 0);
    var o3 = SinOsc.kr(0.3+0.5.rand, 2pi.rand, 0.7);
    Pan2.ar(o1.amclip(o2), o3);
}},susdur:2, transdur:9/8, overlaps:8);