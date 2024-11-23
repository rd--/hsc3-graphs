/* BufRd ; requires */
let numFrames = 2 * 48000;
let buf = BufAlloc(1, numFrames).BufClear;
let osc = SinOsc(LfNoise1(2) * 300 + 400, 0) * 0.1;
let wr = BufWr(buf, Phasor(0, BufRateScale(buf), 0, BufFrames(buf), 0), 1, osc);
BufRd(1, buf, SinOsc(0.1, 0) * BufFrames(buf), 1, 2) <! wr
