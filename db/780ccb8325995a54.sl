(* BufRd ; requires=kr *)
let numFrames = 2 * 48000;
let buf = BufAlloc(1, numFrames);
let osc = SinOsc(LfNoise1(2).kr * 300 + 400, 0) * 0.1;
let wr = BufWrite(buf, Phasor(0, 1, 0, numFrames, 0), 1, osc);
BufRd(1, buf, Phasor(0, 1, 0, numFrames, 0), 1, 2) <! wr
