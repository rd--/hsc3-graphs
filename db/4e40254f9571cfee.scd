// <https://swiki.hfbk-hamburg.de/MusicTechnology/899> (tw ; tim walters)
var s = {
    arg k;
    var f = {
        arg i;
        var x = Impulse.kr((0.5 ** i) / k, 0); // divide by zero = inf ; (k + 1)
        SinOsc.ar(i, SinOsc.ar((i + k) ** i, 0) / (Decay.kr(x, [i, i + 1]) * k)) // multiply by zero = 0
    };
    f.dup(6).sum
};
(GVerb.ar(s.dup(16).sum, 1, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) / 512).flop.sum
