// ln 2021-04-19 https://lukasnowok.github.io/spectrology/
IFFT.ar(PV_BrickWall(FFT.kr(LocalBuf.ir(1024), (SinOsc.ar(Array.geom(100,20000,1.1)*Line.ar(1,0,20))*0.1).sum),LFSaw.ar(XLine.ar(4,0.1,20))))
