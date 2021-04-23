// ln 2021-04-12 https://lukasnowok.github.io/spectrology/
{var chain = LocalBuf(1024)
;chain = FFT(chain, WhiteNoise.ar)
;chain = PV_BrickWall(chain, Line.ar(-1, 1, 20))
;IFFT(chain) * 0.1}
