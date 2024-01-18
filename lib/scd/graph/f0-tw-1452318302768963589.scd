//---- https://twitter.com/redFrik/status/1452318302768963589
var b = 2 * pi * #[4, 3, 1, 2, 5] / 5;
var m = 2 ** SinOsc.ar(1 / 50, b) * 99;
var c = m.round(50);
var t = b / (2 * pi) + SinOsc.ar(b / 50, SinOsc.ar(SinOsc.ar(1 / 99, pi).max(0)) ** (2 * pi)).max(0);
var f = SinOsc.ar(b / 9, b) / 3 + c;
var h = CombC.ar(c / 50, 2, t, 5);
var a = 50 / m * SinOsc.ar(b / 50, 0).max(0) + 0.5;
var z = Blip.ar(f, h) * a;
var o = HPF.ar(Splay.ar(z) * 1.5, 15).tanh;
o + GVerb.ar(o.mean * Line.kr(0, 1, 1), 50, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) / 5

//---- https://twitter.com/redFrik/status/1452318302768963589
o=ar(HPF,ar(Splay,ar(Blip,ar(a=SinOsc,(b=2pi*[4,3,1,2,5]/5)/9,b)/3+c=round(m=2**ar(a,1/50,b)*99,50),ar(CombC,c/50,2,b/2pi+ar(a,b/50,ar(a,ar(a,1/99,pi).max)**2pi).max,5),50/m*ar(a,b/50).max+0.5))*1.5,15).tanh;o+ar(GVerb,o.mean*kr(Line),50)/5
