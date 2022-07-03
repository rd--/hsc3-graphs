// ln 2021-04-07 https://lukasnowok.github.io/spectrology/
var chain = LocalBuf.ir(1024, 1);
var trig = Impulse.kr(7);
var env = EnvGen.kr(Env([0,1,1,0], [0, 0.1, 0]), trig);
chain = FFT.kr(chain, WhiteNoise.ar, 0.5, 0, 1, 0);
chain = PV_RandComb(chain, Line.kr(0.6, 1, 20), trig);
chain = PV_BrickWall(chain, 0.05);
(IFFT.ar(chain) * env + SinOsc.ar(1000, 0, 0.2)) * 0.1
