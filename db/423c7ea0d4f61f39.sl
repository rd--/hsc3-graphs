{- MiBraids ; 34=kick ; sample rate, bit reduction and distortion ; requires=keywords -}
let tr = CoinGate(0.3, Impulse(4, 0));
let decim = TRand(1, 32, tr);
let ws = LinLin(LfTri(0.2, 0), -1, 1, 0,1);
MiBraids(
	pitch: 40,
	timbre: 0.7,
	color: 0.7,
	model: 34,
	trig: tr,
	resamp: 2,
	decim: decim,
	bits: 3,
	ws: ws
) ! 2 * 0.1
