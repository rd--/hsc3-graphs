// ring modulated klank (jmcc) #2

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
    var p = 8; // number of partials
    var i = Dust.ar(20, 0.02);
    var a = Klank.ar(`[Array.rand(p, 100, 10000), nil, Array.rand(p, 0.2, 1.0)], i);
    Pan2.ar(SinOsc.ar(LFNoise2.kr(1.0 + 0.3.rand2, 200, 350 + 50.rand), 0, a), 1.0.rand2);
}, 4, 4, 4);