// string wander-cluster (jmcc) #6

"overlap-texture.scd".loadRelative;

~overlap_texture.({
    var note = 50 + 50.rand;
    var note_ = (note + 15.rand - 7).fold(50,120);
    var delay = 1/note_.midicps;
    Pan2.ar(CombC.ar(WhiteNoise.ar(0.008), 0.01, delay, delay * 1000), 1.0.rand2)
},sustainTime:4/3,transitionTime:4/3,overlap:6);
