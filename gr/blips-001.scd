// blips 001 (jmcc) #SC3d1.5

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
    if(0.8.coin, {
        var b = {
            var f = XLine.kr(exprand(0.25, 400), exprand(0.25, 400), 4);
            var nh = XLine.kr(exprand(2, 100), exprand(2, 100), 4);
            Blip.ar(f, nh);
        };
        Pan2.ar(b.() * b.(),Line.kr(1.0.rand2, 1.0.rand2, 4), 0.3);
    },{Silent.ar});
}, 2, 1, 12, postProcess: {
	arg z;
    z = z.distort;
	6.do({z = AllpassN.ar(z, 0.05, [0.05.rand, 0.05.rand], 4)});
	z;
});
