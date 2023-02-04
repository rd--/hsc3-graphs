// https://twitter.com/redFrik/status/727992849527083009
var b = LFSaw.ar(1 / 3, 0);
var c = [0, 1];
var i = LFSaw.ar(b + 1 ** LFSaw.ar(b, 0) * (99 + c));
var j = LFSaw.ar(b * 99, c);
var k = LFSaw.ar(1 / 32, 0);
var u = LFSaw.ar(LFSaw.ar(b, 0) * 40000 % 2000, 0);
var v = LFSaw.ar(6, c) > 0.9 / 2;
i % j % k + (u * v) / 2
