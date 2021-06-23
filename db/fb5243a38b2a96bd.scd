// RPVDecayTbl - FFT pass through sanity check
{var b0 = LocalBuf(2048)
;IFFT.ar(FFT(b0,SoundIn.ar(0)))}
