// ln 2021-05-25 https://lukasnowok.github.io/spectrology/
var o = (SinOsc.ar(Array.series(20, 100, 900), 0) * 0.1).sum;
IFFT.ar(PV_BinScramble(FFT.kr(LocalBuf.ir(4096, 1), o, 0.5, 0, 1, 0), Line.ar(0, 1, 20), 0.8, Impulse.ar(0.25)))

// ln 2021-04-20 https://lukasnowok.github.io/spectrology/
LFTri.ar(EnvGen.ar(Env.new([0,0,22000,0],[7,1,0]),1))

// ln 2021-04-19 https://lukasnowok.github.io/spectrology/
IFFT.ar(PV_BrickWall(FFT.kr(LocalBuf.ir(1024, 1), (SinOsc.ar(Array.geom(100,20000,1.1) * Line.ar(1,0,20))*0.1).sum, 0.5, 0, 1, 0),LFSaw.ar(XLine.ar(4,0.1,20))))

// ln 2021-04-18 https://lukasnowok.github.io/spectrology/
IFFT.ar(PV_BrickWall(FFT.kr(LocalBuf.ir(1024, 1), WhiteNoise.ar * EnvGen.ar(Env.perc(0,1.2), Impulse.kr(1.1)), 0.5, 0, 1, 0),0.601)) +
IFFT.ar(PV_BrickWall(FFT.kr(LocalBuf.ir(1024, 1), WhiteNoise.ar * EnvGen.ar(Env.perc(1,0), Impulse.kr(0.7))*XLine.ar(0.01,1,20), 0.5, 0, 1, 0),-0.5)) +
LFTri.ar(12000)

// ln 2021-04-17 https://lukasnowok.github.io/spectrology/
((SinOsc.ar(Array.geom(10, 1000, 1.4)) * EnvGen.ar(Env([1, 0, 1], [10, 10], \sin))).sum*0.2) +
((SinOsc.ar(Array.geom(10, 800, 1.4)) * EnvGen.ar(Env([0, 1, 0], [10, 10], \sin))).sum*0.2) +
Pulse.ar(4.reciprocal) * 0.1

// ln 2021-04-16 https://lukasnowok.github.io/spectrology/
var trig = Impulse.ar(XLine.ar(1, 1000, 20));
Saw.ar(TRand.ar(50, XLine.ar(50,5000,20), trig)) * EnvGen.ar(Env.perc(0,0.1), trig) * 0.1

// ln 2021-04-15 https://lukasnowok.github.io/spectrology/
Wrap.ar(SinOsc.ar(SinOsc.ar(40.reciprocal)*100+20000), XLine.ar(-1.0, -0.01, 20), 1) * 0.1

// ln 2021-04-14 https://lukasnowok.github.io/spectrology/
Saw.ar(SinOsc.ar(5.reciprocal, Array.series(10, 0, 2*pi/10)).range(100,1500)).sum * 5.reciprocal * 0.1

// ln 2021-04-13 https://lukasnowok.github.io/spectrology/
SinGrain.ar(Impulse.ar(SinOsc.ar(6.reciprocal).range(8, 4000)), 0.005, 10000)

// ln 2021-04-12 https://lukasnowok.github.io/spectrology/
var chain = LocalBuf.ir(1024, 1);
chain = FFT.kr(chain, WhiteNoise.ar, 0.5, 0, 1, 0);
chain = PV_BrickWall(chain, Line.ar(-1, 1, 20));
IFFT.ar(chain) * 0.1

// ln 2021-04-11 https://lukasnowok.github.io/spectrology/
(BPF.ar(WhiteNoise.ar, 10000, XLine.ar(2, 0.002, 20)) + (SinOsc.ar(10000) * XLine.ar(0.001, 0.3, 20))) * 0.1

// ln 2021-04-10 https://lukasnowok.github.io/spectrology/
RHPF.ar(WhiteNoise.ar * EnvGen.ar(Env([0,1,1,0], [0, 0.01, 0]), Impulse.ar(7)), 800, 0.05) + SinOsc.ar(6400, 0, 0.2) * 0.1

// ln 2021-04-09 https://lukasnowok.github.io/spectrology/
SinGrain.ar(Impulse.ar(XLine.ar(10, 0.1, 20)), 0.01, 10000) * 0.1

// ln 2021-04-08 https://lukasnowok.github.io/spectrology/
SinOsc.ar(1000 + LFSaw.ar(LFSaw.ar(Array.geom(4, 0.1, 1.5), mul: 5000), mul:500)).sum * 4.reciprocal * 0.1

// ln 2021-04-07 https://lukasnowok.github.io/spectrology/
var chain = LocalBuf.ir(1024, 1);
var trig = Impulse.kr(7);
var env = EnvGen.kr(Env([0,1,1,0], [0, 0.1, 0]), trig);
chain = FFT.kr(chain, WhiteNoise.ar, 0.5, 0, 1, 0);
chain = PV_RandComb(chain, Line.kr(0.6, 1, 20), trig);
chain = PV_BrickWall(chain, 0.05);
(IFFT.ar(chain) * env + SinOsc.ar(1000, 0, 0.2)) * 0.1

// ln 2021-04-06 https://lukasnowok.github.io/spectrology/
SinOsc.ar(Array.geom(8, 60, 2) *
	Demand.ar(Impulse.ar(8), 0, Dseq(Array.geom(9, 1, 1.25), inf)) *
	XLine.ar(1, 0.7, 20)).sum * 5.reciprocal * 0.1

	// ln 2021-04-05 https://lukasnowok.github.io/spectrology/
	(SinOsc.ar(10000, mul:Array.geom(4,0.01,8)) *
		SinOsc.ar(LFSaw.ar(Array.geom(4, 0.05, 2), mul: Array.geom(4, 1000, 2)))).sum *
		4.reciprocal * 0.1
