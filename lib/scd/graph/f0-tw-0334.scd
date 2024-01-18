// https://sccode.org/1-4Qy ; f0 ; 0334
var b = (1 .. 9).reverse * 4.0015;
var ph = SinOsc.ar(2 / b, 0) * 3 + 4 ** SinOsc.ar(SinOsc.ar(b / 8, 0 ) / 2 + (SinOsc.ar(1 / 33, 0 ) > 0 + 8 * b)) * 6;
Splay.ar(SinOsc.ar(0, ph) * (4 ** SinOsc.ar(1/b, b)).tanh / 2)

//----tweet0334
a=SinOsc;b=(9..1)*4.0015;Splay ar:a.ar(0,a.ar(2/b)*3+4**a.ar(a.ar(b/8)/2+(a.ar(1/33)>0+8*b))*6,4**a.ar(1/b,b)).tanh/2
