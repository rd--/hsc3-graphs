// https://sccode.org/1-4Qy ; f0 ; 0347
var f = {
	arg i;
	var c = i / 48;
	var b = c / 72;
	VarSaw.ar((LFSaw.ar(c, 0) * LFSaw.ar(b, 0) * 8 + 9).roundTo(i % 9 + 1) * 25 + c, c, LFSaw.ar(3, i) + 1 / 3) * (LFSaw.ar(b, i / pi) % 1) / 2
};
Splay2.ar(f.dup(30))

//----tweet0347
a=LFSaw;Splay.ar({|i|VarSaw.ar(round(a.ar(c=i/48)*a.ar(b=c/72)*8+9,i%9+1)*25+c,c,a.ar(3,i)+1/3,a.ar(b,i/pi)%1)/2}!30)
