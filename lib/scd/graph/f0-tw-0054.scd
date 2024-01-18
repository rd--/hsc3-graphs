// https://fredrikolofsson.com/f0blog/more-sc-twitter/ ; not requiring array expansion at duty
var sq = Dseq.dr([2, 2, 2, 2, 2, 2, 4, 3], 99);
var sy = Saw.ar([3, 4]) * 32 + 64;
var sz = Saw.ar([4, 3]) * 99;
(0 .. 4).collect { |x|
	var sw = sz + Duty.kr(1, 0, sq * (4 ** x), 0);
	CombN.ar(SyncSaw.ar(sy, sw) / 9, 1, 1 / 6, 2) * 0.2
}.sum

// https://fredrikolofsson.com/f0blog/more-sc-twitter/
var sy = Saw.ar([3, 4]) * 32 + 64;
var sw = Saw.ar([4, 3]) * 99 + Duty.kr(1, 0, (Dseq.dr([2, 2, 2, 2, 2, 2, 4, 3], 99) * (4 ** (0 .. 4))).flop, 0);
CombN.ar(SyncSaw.ar(sy, sw) / 9, 1, 1 / 6, 2).flop.sum * 0.2

// ---- https://fredrikolofsson.com/f0blog/more-sc-twitter/
CombN.ar(SyncSaw.ar(Saw.ar([3,4],32,64),Saw.ar([4,3],99,Duty.kr(1,0,flop(Dseq(2!6++4++3,99)*(4**(0..4))))))/9,1,1/6,2)

// ---- calculations
2.dup(6) ++ 4 ++ 3 == [2, 2, 2, 2, 2, 2, 4, 3]
