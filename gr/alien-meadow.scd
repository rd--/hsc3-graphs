// alien meadow (jmcc) #6

"overlap-texture.scd".loadRelative;

~overlap_texture.({
    var a = 20.0.rand;
    var b = 5000.0.rand;
    var c = 20.0.rand;
    var pan = 1.0.rand2;
    Pan2.ar(SinOsc.ar(SinOsc.ar(a, 0, 0.1*b, b), 0, SinOsc.kr(c, 0, 0.05, 0.05)), pan);
},sustainTime:6,transitionTime:2,overlap:6);
