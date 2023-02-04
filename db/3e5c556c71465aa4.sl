;; http://earslap.com/weblog/music-release-laconicism.html
var k = DmdFor(6.4, 0, Dseq(inf, [0.05, Drand(1, [0.04, 0.08])]));
Splay(Integrator((LfNoise0(5 ! 3) * k).RoundTo(k / 10), 1).Sin.Sqrt.Tanh, 0.3, 1, 0, true)
