// ln 2021-04-12 https://lukasnowok.github.io/spectrology/
{var chain = LocalBuf.ir(1024)
;chain = FFT.kr(chain, WhiteNoise.ar)
;chain = PV_BrickWall(chain, Line.ar(-1, 1, 20))
;IFFT.ar(chain) * 0.1}
