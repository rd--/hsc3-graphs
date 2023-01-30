// jmcc ; choip choip choip
var dur = 12;
var z = OverlapTexture({
    arg tr;
    var i = Impulse.ar(TxLine.kr(TExpRand.kr(1, 30, tr), TExpRand.kr(1, 30, tr), dur, tr), 0);
    var f = TxLine.kr(TExpRand.kr(600.0, 8000.0, tr), TExpRand.kr(600.0, 8000.0, tr), dur, tr);
    var o = SinOsc.ar(Decay2.ar(i, 0.05, 0.5) * -0.9 * f + f, 0);
    var l = TxLine.kr(TExpRand.kr(0.01, 0.5, tr), TExpRand.kr(0.01, 0.5, tr), dur, tr);
    var s = Decay2.ar(i * l, 0.01, 0.2) * o;
    Pan2.ar(s, TLine.kr(TRand.kr(-1, 1, tr), TRand.kr(-1, 1, tr), dur, tr), 1)
}, dur - 2, 1, 8, 2);
4.do({ z = AllpassN.ar(z, 0.1, { Rand.ir(0, 0.05) }.dup, 4) });
z
