// swept resonant noise (jmcc) #2

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
    var p = 10; // number of partials
    var n = WhiteNoise.ar(0.007);
    var f = FSinOsc.kr(0.1 + 0.2.rand,0,12 + 12.rand2,60 + 24.rand2).midicps;
    var sweep = Resonz.ar(n,f,0.1);
    var spec_f = {`[Array.fill(p,{80 + 10000.0.linrand}),nil,Array.fill(p,{0.5 + 2.0.rand})]};
    var spec = Array.fill(2,spec_f);
    Klank.ar(spec,sweep);
},4,4,5);
