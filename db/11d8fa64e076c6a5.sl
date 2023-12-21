(* Integrator ; https://nathan.ho.name/posts/feedback-integrator-networks/ ; blockSize=1 *)
var n = 8;
var fixed = false;
var snd = Impulse(0, 0);
snd := snd + LocalIn(n, 0);
snd := Integrator(snd, 0.99);
snd := { { fixed.if { Rand(-1, 1) } { LfNoise2(pi) } * 1000 } ! n } ! n * snd;
snd := snd.Sum;
snd := LeakDc(snd, 0.995);
snd := snd.Clip2(1);
snd.Splay <! LocalOut(snd) * 0.1
