/* http://www.fredrikolofsson.com/f0blog/?q=node/619 */
let freq = [100 300 400].atRandom;
let amp = 0.1;
let fb = [1 2 3].atRandom;
let del = [0.01 0.02 0.1 0.5].atRandom;
let lfo = [1 15 100 200].atRandom;
let rate = [0.01 2].atRandom;
let cutoff = [100, 500].atRandom;
let env = Perc(1, 1, 4, -4);
let lin = DelayN(Hpf(LocalIn(1, [0]), cutoff), 1, del);
let src = SinOsc(freq + (SinOsc(rate, 0) * lfo), lin * 2.pi * fb) * amp * env;
EqPan2(src <! LocalOut(src), 0)
