// https://twitter.com/sluyterrific_sc/status/435684664200540161 (es)
var f = {
    arg i;
    var m = (i % LFNoise2.kr(freq: 0.01, mul: 50, add: 50)) + LFNoise2.kr(freq: 0.1, mul: 10, add: 40);
    SinOsc.ar(freq: m.midicps, phase: 0) * LFNoise2.kr(freq: 1, mul: 0.01, add: 0.01)
};
Splay.ar(inArray: 1.to(99).collect(f))

// https://twitter.com/sluyterrific_sc/status/435684664200540161 (es)
var f = {
    arg i;
    var m = (i % LFNoise2.kr(0.01,50,50)) + LFNoise2.kr(0.1,10,40);
    SinOsc.ar(m.midicps) * LFNoise2.kr(1,0.01,0.01)
};
Splay.ar(1.to(99).collect(f))

// https://twitter.com/sluyterrific_sc/status/435684664200540161 (es)
var f = {
    arg i;
    var m = (i % (LFNoise2.kr(0.01) * 50 + 50)) + (LFNoise2.kr(0.1) * 10 + 40);
    SinOsc.ar(m.midicps) * (LFNoise2.kr(1) * 0.01 + 0.01)
};
Splay.ar(1.to(99).collect(f))

// https://twitter.com/sluyterrific_sc/status/435684664200540161 (es)
var i = 1;
var o = List.new();
var f = {
    var m = (i % (LFNoise2.kr(0.01) * 50 + 50)) + (LFNoise2.kr(0.1) * 10 + 40);
    o.add(SinOsc.ar(m.midicps, 0) * (LFNoise2.kr(1) * 0.01 + 0.01));
    i = i + 1
};
99.do(f);
o.splay
