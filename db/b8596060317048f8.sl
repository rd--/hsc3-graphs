let tbl = (0 .. 180).collect { :each |
	each.degreesToRadians.sin
}.asLocalBuf;
let dur = 1 / 7;
let tr = Impulse(5, 0);
let ph = TLine(0, BufFrames(tbl), dur, tr);
let win = BufRd(1, tbl, ph, 1, 2);
SinOsc(TExpRand(111, 555, tr), 0) * win / 3
