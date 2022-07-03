// ln 2021-04-18 https://lukasnowok.github.io/spectrology/
IFFT.ar(PV_BrickWall(FFT.kr(LocalBuf.ir(1024, 1), WhiteNoise.ar * EnvGen.ar(Env.perc(0,1.2), Impulse.kr(1.1)), 0.5, 0, 1, 0),0.601)) +
IFFT.ar(PV_BrickWall(FFT.kr(LocalBuf.ir(1024, 1), WhiteNoise.ar * EnvGen.ar(Env.perc(1,0), Impulse.kr(0.7))*XLine.ar(0.01,1,20), 0.5, 0, 1, 0),-0.5)) +
LFTri.ar(12000)
