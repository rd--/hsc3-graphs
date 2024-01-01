var sf = SfAcquire('floating_1', 1, [1]).first;
var sw = LfSaw(1 / SfDur(sf), 0);
var ph = sw.Range(0, SfFrames(sf));
BufRd(1, sf, ph, 1, 2)
