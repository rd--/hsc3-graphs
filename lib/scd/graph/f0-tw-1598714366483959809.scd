// https://twitter.com/redFrik/status/1598714366483959809
var b = (1 .. 9);
var l = SinOsc.ar(9 ** SinOsc.ar(1 / 99, 0) / b, 0);
var p = LocalIn.ar(9, 0);
var t = 1 - Amplitude.ar(p, 0.01, 0.01).lag(1 / 99);
var o = SinOsc.ar(99 + l, l - t ** SinOsc.ar(t ** 9 * 999 / b, 0) * 9) * t;
var v = 0.9 ** 9;
{ | i |
	p = p.rotate(1);
	o = o + CombC.ar(p, 0.9, SinOsc.ar(1 / b / 9, 0).range(b ** i / (99 + 9), b ** i / 99), i + 1)
} ! 3;
o = HPF.ar(o * l.max(0) * v, 9).tanh;
LocalOut.ar(o);
Splay.ar(o * v)

//----
play{l=ar(a=SinOsc,9**ar(a,1/99)/b=(1..9));t=1-ar(Amplitude,p=ar(LocalIn,9)).lag(1/99);o=ar(a,99+l,l-t**ar(a,t**9*999/b)*9,t);{|i|o=o+ar(CombC,p=p.rotate,0.9,ar(a,1/b/9).range(*b**i/[99+9,99]),i+1)}!3;ar(LocalOut,o=tanh(ar(HPF,o*l.max*v=0.9**9,9)));ar(Splay,o*v)}
