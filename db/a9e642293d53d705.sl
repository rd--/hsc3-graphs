let sf = SfAcquire('floating_1', 1, [1]).first;
let sw = LfSaw(1 / SfDur(sf), 0);
let ph = sw.LinLin(-1, 1, 0, SfFrames(sf));
BufRd(1, sf, ph, 1, 2)
