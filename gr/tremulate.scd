// tremulate (jmcc) #1

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~tremulate = {
    var f = 500 + 400.rand;
    var r = 30 + 60.rand;
    var o = FSinOsc.ar(f*[1.0,1.2,1.5,1.8]);
    var a = max(0,LFNoise2.kr([r,r,r,r],0.1));
    var l = [1.0.rand2,1.0.rand2,1.0.rand2,1.0.rand2];
    Mix.ar(Pan2.ar(o*a,l));
};
~overlap_texture.(~tremulate,sustainTime:0.5,transitionTime:2,overlap:3);
~post_process.({arg z; CombN.ar(z,0.1,0.1,1)});
