// ccomb (rd)
var lwr = 48;
var flwr = lwr.midicps;
var t = Dust.kr(#[0.75, 0.35]);
var spart = {
    var n = LinLin.kr(LFNoise2.kr(0.1), -1, 1, lwr, 72);
    var e = Decay2.kr(t, 0.01, TRand.kr(0.05, 0.75, t));
    var x = WhiteNoise.ar() * e * 0.1;
    var m = LFNoise2.kr(0.1);
    var f = Lag.kr(n.midicps, 0.25);
    CombC.ar(x, flwr.reciprocal, f.reciprocal, LinLin.kr(m, -1, 1, 1, 8))
};
spart.dup(12).sum * 0.1
