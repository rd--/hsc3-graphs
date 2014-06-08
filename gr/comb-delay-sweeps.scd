// comb delay sweeps (jmcc)

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~comb_delay_sweeps = {
    arg dur;
    {
        var note = 50 + 70.rand;
        var endNote = (note + 15.rand - 7).fold(50,120);
        var note_ = (note + 15.rand - 7).fold(50,120);
        var endNote_ = (endNote + 15.rand - 7).fold(50,120);
        var noteSweep = Line.kr(note_, endNote_, dur);
        var dt = 1/noteSweep.midicps;
        var dc = 1/note_.midicps * 1000;
        Pan2.ar(CombC.ar(WhiteNoise.ar(0.005), 0.01, dt, dc),1.0.rand2);
    }
};
~overlap_texture.(~comb_delay_sweeps.(4),sustainTime:4/3,transitionTime:4/3,overlap:6);
