{- asLocalBuf ; matrix form -}
let buf = [48 60 69; 62 64 65].asLocalBuf;
let freq = BufRd(2, buf, MouseX(0, 3, 0, 0.2), 1, 1).MidiCps;
SinOsc(freq, 0) * 0.1
