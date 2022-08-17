// PV_DecayTable ; FFT pass through sanity check
var b0 = LocalBuf.new(2048);
IFFT.ar(FFT.new(b0, SoundIn.ar(0)))
