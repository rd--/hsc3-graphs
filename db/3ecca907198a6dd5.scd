// Integrator ; https://nathan.ho.name/posts/feedback-integrator-networks/ ; blockSize=1
var n = 8;
var snd = Impulse.ar(0, 0);
snd = snd + LocalIn.ar(n, 0);
snd = Integrator.ar(snd, 0.99);
snd = snd * ({ { Rand.ir(-1, 1) * 1000 }.dup(n) }.dup(n));
snd = snd.sum;
snd = LeakDC.ar(snd, 0.995);
snd = snd.clip2;
Splay.ar(snd <! LocalOut.ar(snd), 1, 1, 0, true) * 0.1
