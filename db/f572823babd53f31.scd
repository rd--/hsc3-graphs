// https://twitter.com/sluyterrific_sc/status/435684664200540161 (es)
var f = {
    arg i;
    var m = (i % LFNoise2.kr(0.01,50,50)) + LFNoise2.kr(0.1,10,40);
    SinOsc.ar(m.midicps) * LFNoise2.kr(1,0.01,0.01)
};
Splay.ar((1 .. 99).collect(f))
