// phase modulation with slow beats ; jmcc #6 ; graph rewrite
var n = 4;
var x = MouseX.kr(100, 6000, 1, 0.2);
var y = MouseY.kr(0, 2, 0, 0.2);
OverlapTexture({
    arg tr;
    var a = 0;
    var f1 = TRand.kr(0, x, tr);
    3.timesRepeat({
        var f2 = TRand.kr(0, x, tr);
        a = SinOsc.ar([f2, f2 + TRand(-1, 1, tr)], 0) * y + a;
    });
    SinOsc.ar([f1, f1 + TRand.kr(-1, 1, tr)], a) * 0.1
}, 4, 4, n) * 0.25

//---- phase modulation with slow beats ; jmcc #6
var n = 4;
RTexture.overlap({
    var x = MouseX.kr(100, 6000, 1, 0.2);
    var y = MouseY.kr(0, 2, 0, 0.2);
    var a = 0;
    var f1 = Rand.ir(0, x);
    3.timesRepeat({
        var f2 = Rand.ir(0, x);
        a = SinOsc.ar([f2, f2 + Rand.ir(-1, 1)], 0) * y + a;
    });
    SinOsc.ar([f1, f1 + Rand.ir(-1, 1)], a) * 0.1
}, 4, 4, n, 2)

//---- notes.md
_MouseX_ controls random frequency of new events.

_MouseY_ controls modulation index.
