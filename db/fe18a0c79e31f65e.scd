// In ; two single channel Ins, each delayed by one second
DelayN.ar(In.ar(NumOutputBuses.ir + [0, 1], 1), 1, 1)
