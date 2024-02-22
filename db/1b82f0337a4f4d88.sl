let tbl = 0:180.collect { :each |
	each.degreesToRadians.sin
}.asLocalBuf;
let dur = 3;
let ph = Line(0, BufFrames(tbl), dur);
let win = BufRd(1, tbl, ph, 1, 2);
SinOsc(440, 0) * 0.1 * win
