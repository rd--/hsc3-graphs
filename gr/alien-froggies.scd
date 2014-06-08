// alien froggies (jmcc)

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~alien_froggies = {
    arg rate;
    {
        var r = (rate * (0.2.bilinrand.exp)).fold(1.0,30.0);
        Formant.ar(r,exprand(200,3000.0),9.0.rand * r + r,0.05);
    };
};
~overlap_texture.(~alien_froggies.(11),sustainTime:0.5,transitionTime:0.25,overlap:5);
