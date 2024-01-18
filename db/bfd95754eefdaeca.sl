{- TBufChoose ; control rate -}
let tr = Impulse(4, 0).kr;
let nt = TBufChoose(tr, [0 2 4 5 7 9 11].asLocalBuf);
SinOsc((48 + nt).MidiCps.Lag(0.1), 0) * 0.1
