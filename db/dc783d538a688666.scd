// DustRange ; a = noise, b & c = impulses
var a = DustRange.ar(iotMin: 0.0001, iotMax: 0.001) * 0.1;
var b = DustRange.ar(iotMin: 0.1, iotMax: 0.1) * 0.5;
var c = DustRange.ar(iotMin: 0.5, iotMax: 1.25);
Splay.ar([a, b, c])
