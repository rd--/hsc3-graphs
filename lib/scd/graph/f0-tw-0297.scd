// https://sccode.org/1-4Qy ; f0 ; 0297
var f = {
	arg i;
	var c = SinOscFB.ar(i + 1 / [6, 4], 0) / (SinOscFB.ar(1 / [8, 9], 0) + 1.5);
	var d = c % DelayN.ar(c, 0.2, 0.2);
	SinOscFB.ar(1 + c ** i + i * 99, d) * Lag3.ar(d, c % 1 / 99)
};
Splay.ar((0 .. 3).collect(f)) / 3

//----tweet0297
a=SinOscFB;Splay.ar({|i|a.ar(1+(c=a.ar(i+1/[6,4])/(a.ar(1/[8,9])+1.5))**i+i*99,d=c%DelayN.ar(c),d.lag3(c%1/99))}!4)/3
