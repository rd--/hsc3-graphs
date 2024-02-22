// https://fredrikolofsson.com/f0blog/more-sc-twitter/
var sy = Saw.ar([3, 4]) * 32 + 64;
var sw = Saw.ar([4, 3]) * 99 + Duty.kr(1, 0, (Dseq([2, 2, 2, 2, 2, 2, 4, 3], 99) * (4 ** (0 .. 4))).flop, 0);
CombN.ar(SyncSaw.ar(sy, sw) / 9, 1, 1 / 6, 2).flop.sum * 0.2
