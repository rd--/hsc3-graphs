// <https://swiki.hfbk-hamburg.de/MusicTechnology/899> (tw ; tim walters)
var nd = {
    arg k;
    var x = {
        arg f, m, j;
        SinOsc.ar(freq: f + (m * 4 * j), phase: m) * LFNoise1.ar(freq: j + 1 / f * 4) / 2
    };
    var y = x.value(0.1, 0, 8);
    9.do({ arg i; y = x.value(i * k * [4, 8], y, i) });
y};
(0->7).mixFill(nd) / 4
