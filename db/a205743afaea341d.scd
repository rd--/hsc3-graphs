// https://fredrikolofsson.com/f0blog/more-sc-twitter/ ; not requiring array expansion at duty
var sq = Dseq([2, 2, 2, 2, 2, 2, 4, 3], 99);
var sy = Saw.ar([3, 4]) * 32 + 64;
var sz = Saw.ar([4, 3]) * 99;
(0 .. 4).collect { |x|
	var sw = sz + Duty.kr(1, 0, sq * (4 ** x), 0);
	CombN.ar(SyncSaw.ar(sy, sw) / 9, 1, 1 / 6, 2) * 0.2
}.sum
