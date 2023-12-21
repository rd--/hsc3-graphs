// LoopSet - random loops
var buf = 10;
var n = 24;
var i = BufRateScale.kr(buf) * [1, 4/5];
var f = {
	var left = 1.0.rand;
	var right = left + (1.0 - left).rand;
	[left, right, (12/n).rand, 0.166 + 0.166.rand]
};
var a = (f ! n).flatten;
LoopSet.ar(buf, 0, 0.1, [1, 3/2], i, a)
