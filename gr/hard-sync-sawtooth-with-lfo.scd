// hard sync sawtooth with lfo (jmcc) #6

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
    var f = (30 + 50.rand).midicps;
    SyncSaw.ar([f, f + 0.2], SinOsc.kr(0.2, [0, 2pi.rand], 2*f, 3*f), 0.05);
}, 4, 4, 4);
~post_process.({arg z; CombN.ar(z, 0.3, 0.3, 4, 1, z.reverse)});
