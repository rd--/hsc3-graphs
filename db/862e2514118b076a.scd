// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) [Line 40]
var f = {
    arg i;
    var t = 0.6 ** i * 40 * Impulse.ar(2 ** i / 32, 1 / 2);
    var f = 4 ** LFNoise0.kr(1 / 16) * 300;
    RLPF.ar(t, f, 0.005).sin
};
var x = 0.to(8).collect(f).splay;
2.do({x = FreeVerb2.ar(x.first, x.second, 0.1, 1, 1)});
x
