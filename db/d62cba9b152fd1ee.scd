// PV_DecayTable ; random decay multipliers
var b0 = LocalBuf.new(2048).clear;
var b1 = LocalBuf.newFrom({ 0.5.rrand(0.975) } ! 1024);
var b2 = LocalBuf(1024).clear;
IFFT.ar(PV_DecayTable(FFT.new(b0, SoundIn.ar(0)), b1, b2))
