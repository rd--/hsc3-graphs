let scaleBuf = [0 2 3 5 7 8 10 12].asLocalBuf;
let mnn = BufRd(1, scaleBuf, MouseX(0, 8, 0, 0.2), 1, 1) + 48;
SinOsc(mnn.MidiCps, 0) * 0.1
