// ln 2021-04-12 https://lukasnowok.github.io/spectrology/
var chain = LocalBuf(1024, 1);
chain = FFT(chain, WhiteNoise.ar, 0.5, 0, 1, 0);
chain = PV_BrickWall(chain, Line.ar(-1, 1, 20));
IFFT.ar(chain) * 0.1
