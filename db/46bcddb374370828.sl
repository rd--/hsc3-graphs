(* http://earslap.com/weblog/music-release-laconicism.html *)
let k = Duty(6.4, 0, Dseq(inf, [0.05, Drand(1, [0.04, 0.08])]));
Integrator((LfNoise0([5, 5, 5]) * k).RoundTo(k / 10), 1).Sin.Sqrt.Tanh.Splay2(0.3,1, 0, true)
