let tbl = { :trig :dist :lo :hi |
	TableRand(trig, dist.asRandomTable(128).asLocalBuf).LinExp(0, 1, lo, hi)
};
let x = MouseX(7, [7 * 11, 11 * 23], 1, 0.2);
let tr = Dust(x).kr;
let carFreq = [
	tbl(tr, [0 1 0 0 1 0 0 0 1 0], 55, 555),
	tbl(tr, [1 0 1 1 0 1 1 1 0 1], 55, 555)
];
let modFreq = carFreq * [
	tbl(tr, [1 0 0 1 0 0 1], 1, 23),
	tbl(tr, [0 1 1 0 1 1 0], 1, 23)
].RoundTo(1);
let index = [
	tbl(tr, [0 0 0 1], 1, 23),
	tbl(tr, [1 0 0 0], 1, 23)
];
GrainFm(1, tr, 7 / x, carFreq, modFreq, index, 0, -1, 512).Mix / 23 / 7
