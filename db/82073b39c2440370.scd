// ln 2021-05-25 https://lukasnowok.github.io/spectrology/
IFFT.ar(PV_BinScramble(FFT.kr(LocalBuf.ir(4096),SinOsc.ar(Array.series(20,100, 900),mul:0.1).sum),Line.ar(dur:20),0.8,Impulse.ar(0.25)))
