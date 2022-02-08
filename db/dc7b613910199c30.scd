// https://fredrikolofsson.com/f0blog/more-sc-twitter/
{var sy = Saw.ar(#[3, 4]) * 32 + 64
;var sw = Saw.ar(#[4, 3]) * 99 + Duty.kr(1, 0, (Dseq.dr(#[2, 2, 2, 2, 2, 2, 4, 3], 99) * (4 ** 5.iota)).flop, 0)
;CombN.ar(SyncSaw.ar(sy, sw) / 9, 1, 1 / 6, 2) * 0.1}
