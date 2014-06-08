// saucer base (jmcc) #6

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
    var a = 20.0.rand;
    var b = 1000.0.rand;
    var c = 5000.0.rand;
    var pan = 1.0.rand2;
    Pan2.ar(SinOsc.ar(SinOsc.ar(SinOsc.ar(a, 0, b, 1.1*b), 0, c, 1.1*c), 0, 0.1), pan);
},6,2,4);

