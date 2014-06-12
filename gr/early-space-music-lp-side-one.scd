// early space music lp side one (jmcc) #12

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
	var scale = [0, 2, 4, 5, 7, 9, 11];
	var octave = [24, 36, 48, 60, 72, 84, 96] - 3;
    var s1 = {
        var f = (scale.choose + octave.choose).midicps;
        var z = {
            var ff = f * SinOsc.kr(exprand(4,6),0,0.008,1);
            LFSaw.ar([ff * rrand(0.99,1.01), ff * rrand(0.99,1.01)], 0, 0.01)
        };
        var x = LPZ2.ar(LPZ2.ar(Mix.arFill(10, z)));
        if (0.3.coin && (f < 1400), {
            x = RLPF.ar(x, SinOsc.kr(rrand(0.3,0.8),0,f*rrand(0.5,3), f * rrand(4,12)), 0.1)
        });
        x
    };
    var s2 = {
        var rnd = {exprand(4,12) * [1,rrand(0.9,1.1)]};
        var rates = XLine.kr(rnd.(), rnd.(), 12) * [1,-1].choose;
        var sw = LFSaw.kr(rates, 0, rrand(2,16), rrand(40,120));
        var f = LFTri.kr(exprand(0.25,0.5) * [1,-1].choose, 0, linrand(4,30), sw).midicps;
        CombN.ar(SinOsc.ar(f, 0, 0.02), 0.3, rrand(0.15,0.3), 4)
    };
    [s1,s2].choose.();
}, 4, 4, 6, postProcess: {
    arg z;
    CombN.ar(z, 0.5, [0.5,0.47], 7, 1, z.reverse)
});
