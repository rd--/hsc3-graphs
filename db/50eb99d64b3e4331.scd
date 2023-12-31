// http://earslap.com/article/sctweeting.html
var a = LocalIn.ar(1, 0);
var x = SinOsc.ar((Decay.ar(Impulse.ar([4, 4.005], 0), 1000 * a.abs) * 50), a).distort;
x <! LocalOut.ar(Mix.ar(x))
