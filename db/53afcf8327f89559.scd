// ln 2021-05-25 https://lukasnowok.github.io/spectrology/
var o = (SinOsc.ar(Array.series(20, 100, 900), 0) * 0.1).sum;
IFFT.ar(PV_BinScramble(FFT(LocalBuf(4096, 1), o, 0.5, 0, 1, 0), Line.ar(0, 1, 20), 0.8, Impulse.ar(0.25)))
