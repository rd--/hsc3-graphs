// tw 0041 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/537
var s = Sweep.ar(LocalIn.ar(6, 0), 1);
var i = Impulse.ar(#[1, 0.749, 6, 12, 3, 4], 0);
var o = SinOsc.ar(1 / RunningMax.ar(s, i), 0);
o.splay.tanh <! LocalOut.ar(o) / 2 * 0.1
