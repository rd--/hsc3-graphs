// https://sccode.org/1-4Qy ; f0 ; 0272
var b = 3.to(8) * (SinOsc.ar(0.05, 0).rounded / 4 + 1);
var c = SinOsc.ar(1.1 / b, 0);
var o = SinOsc.ar(TwoPole.ar(SinOsc.ar(2 ** b, 0) > c, b * 99, c % 0.5 + 0.5)) / 2;
HPF.ar(Splay2.ar(o), 9)

//----tweet0272
a=SinOsc;HPF.ar(Splay ar:a.ar(TwoPole.ar(a.ar(2**b=(3..8)*(a.ar(0.05).round/4+1))>c=a.ar(1.1/b),b*99,c%0.5+0.5))/2,9)
