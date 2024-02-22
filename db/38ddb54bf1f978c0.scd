// ExpRandN - n node klang synthesis
var n = 120;
var f = ExpRandN.ir(n, 40, 18000);
var a = ExpRandN.ir(n, 0.1, 0.3);
var p = RandN.ir(n, -1, 1);
{
	Klang.ar(Ref.new([f, a, p])) * 0.01
} ! 2
