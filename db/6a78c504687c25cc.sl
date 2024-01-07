let tbl = (0 .. 511).collect { :each |
	(each / 512 * pi).sin
}.asLocalBuf;
let k = 7;
let dur = 1 / k;
let tr = TrigRoundRobin(k, Impulse(k, 0));
let win = TableWindow(tr, dur, tbl);
Splay(
	SinOsc(TExpRand(111, 555, tr), 0) * win / 3
)
