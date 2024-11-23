/* FreqShift */
let a = Blip(60, 4) * LfGauss(4, 1 / 8, 0, 1, 0);
let b = a / 4 + LocalIn(2, 0);
let c = FreqShift(b, LfNoise0(1 / 4) * 90, 0);
c <! LocalOut(DelayC(c, 1, 0.1) * 0.9)
