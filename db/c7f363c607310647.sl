(* http://www.fredrikolofsson.com/f0blog/?q=node/619 *)
var freq = [100 300 400].atRandom;
var amp = 0.1;
var fb = [1 2 3].atRandom;
var del = [0.01 0.02 0.1 0.5].atRandom;
var lfo = [1 15 100 200].atRandom;
var rate = [0.01 2].atRandom;
var cutoff = [100, 500].atRandom;
var env = Perc(1, 1, 4, -4);
var lin = DelayN(Hpf(LocalIn(1, [0]), cutoff), 1, del);
var src = SinOsc(freq + (SinOsc(rate, 0) * lfo), lin * 2.pi * fb) * amp * env;
EqPan2(src <! LocalOut(src), 0)
