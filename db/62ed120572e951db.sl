var tbl = (0 .. 180).collect { :each |
	each.degreesToRadians.sin
}.asLocalBuf;
var dur = 3;
var ph = Line(0, BufFrames(tbl), dur);
var win = BufRd(1, tbl, ph, 1, 2);
SinOsc(440, 0) * 0.1 * win
