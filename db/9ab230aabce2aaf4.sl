var scaleBuf = [0 2 3 5; 7 8 10 12].asLocalBuf;
var mnn = BufRd(2, scaleBuf, MouseX(0, 4, 0, 0.2), 1, 1) + 48;
SinOsc(mnn.MidiCps, 0) * 0.1
