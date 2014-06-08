// sawed cymbals (jmcc) #9

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
    var p = 15;	// number of partials per channel per 'cymbal'.
    var f1 = 500 + 2000.0.rand;
    var f2 = 8000.0.rand;
    var fr = Array.fill(p, {f1 + f2.rand}); // frequencies
    var rt = Array.fill(p, {2.0 + 4.0.rand}); // ring times
    var sp = Array.fill(2, {`[fr,nil,rt]});
    Klank.ar(sp,LFSaw.ar(XLine.kr(600.0.rand, 600.0.rand, 12), 0, 0.0005));
}, 4, 4, 6);

