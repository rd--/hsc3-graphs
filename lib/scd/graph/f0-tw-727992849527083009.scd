// https://twitter.com/redFrik/status/727992849527083009
var b = LFSaw.ar(1 / 3, 0);
var c = [0, 1];
var i = LFSaw.ar(b + 1 ** LFSaw.ar(b, 0) * (99 + c));
var j = LFSaw.ar(b * 99, c);
var k = LFSaw.ar(1 / 32, 0);
var u = LFSaw.ar(LFSaw.ar(b, 0) * 40000 % 2000, 0);
var v = LFSaw.ar(6, c) > 0.9 / 2;
i % j % k + (u * v) / 2

// ---- https://twitter.com/redFrik/status/727992849527083009
a=LFSaw;a.ar((b=a.ar(1/3))+1**a.ar(b)*(99+c=[0,1]))%a.ar(b*99,c)%a.ar(1/32)+a.ar(a.ar(b)*4e4%2e3,0,a.ar(6,c)>0.9/2)/2
