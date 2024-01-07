let sf = SfAcquire('floating_1', 1, [1]).first;
let phase = LfNoise2(MouseX(2, 20, 1, 0.2)) * SfFrames(sf);
BufRd(1, sf, phase, 1, 2)
