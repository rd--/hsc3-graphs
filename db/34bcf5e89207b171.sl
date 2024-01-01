var tbl = (0 .. 180).collect { :each |
	each.degreesToRadians.sin
}.asLocalBuf;
var dur = 1 / 7;
var tr = Impulse(5, 0);
var ph = TLine(0, BufFrames(tbl), dur, tr);
var win = BufRd(1, tbl, ph, 1, 2);
SinOsc(TExpRand(111, 555, tr), 0) * win / 3
