let tbl = [0 2 10 12].asLocalBuf;
SinOsc((Osc1(tbl, 5) + 48).MidiCps, 0) * 0.1
