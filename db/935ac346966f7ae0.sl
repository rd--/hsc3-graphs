(* http://earslap.com/weblog/music-release-laconicism.html *)
var i = { :freq | Impulse(freq, 0) };
var ph = Integrator(Integrator(i(64).Lag(LfNoise1([2, 2]) * 2 + 2) * 99, 0.9), 0.99).Fold2(pi);
SinOsc(LagUd(Impulse(2, 0), 0, 0.4) * 360, ph) / 3
