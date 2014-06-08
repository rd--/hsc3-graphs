// alien froggies (jmcc) #1

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
    var rate = 11;
    var r = (rate * (0.2.bilinrand.exp)).fold(1.0,30.0);
    Formant.ar(r,exprand(200,3000.0),9.0.rand * r + r,0.05);
},sustainTime:0.5,transitionTime:0.25,overlap:5);
