// https://sccode.org/1-4Qy ; f0 ; 0309
var b = (1 .. 9);
var c = SinOscFB.ar(SinOscFB.ar(SinOscFB.ar(99 / b, 1), 1 / b) + b * 50, 1);
GVerb.ar((FreqShift.ar(c, 1 / b) + c).mean / 3, 200, 3, 0.5, 0.5, 9, 1, 0.7, 1, 300)

//----tweet0309
a=SinOscFB;GVerb.ar(mean(FreqShift.ar(c=a.ar(a.ar(a.ar(99/b=(1..9),1),1/b)+b*50,1),1/b)+c)/3,200,3,0.5,0.5,9,1,0.7,1)
