// RPVDecayTbl ; random decay multipliers
{var b0 = LocalBuf.new(2048).clear
;var b1 = LocalBuf.newFrom(Array.fill(1024,{0.5.rrand(0.975)}))
;var b2 = LocalBuf(1024).clear
;IFFT.ar(RPVDecayTbl.new(FFT.new(b0,SoundIn.ar(0)),b1,b2))}
