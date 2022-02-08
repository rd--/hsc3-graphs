// RExpRandN - n node klang synthesis
var n = 120;
var f = RExpRandN(n, 40, 18000);
var a = RExpRandN(n, 0.1, 0.3);
var p = RRandN(n, -1, 1);
{Klang.ar(Ref([f,a,p])) * 0.01}.dup
