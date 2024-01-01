var tr = Impulse(0.25, 0);
var gainEnv = Decay2(tr, 0.01, 1);
EqPan(
	Saw(TxLine(100, 1000, 0.1, tr)),
	TLine(-1, 1, 0.75, tr)
) * gainEnv
