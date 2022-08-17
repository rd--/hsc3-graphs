// MiBraids ; 34=kick ; sample rate, bit reduction and distortion
var trig =  CoinGate.kr(0.3, Impulse.kr(4, 0));
var decim = TRand.kr(1,32,trig);
var ws = LinLin.kr(LFTri.kr(0.2, 0), -1, 1, 0,1);
MiBraids.ar(pitch: 40, timbre: 0.7, color: 0.7, model: 34, trig: trig, resamp: 2, decim: decim, bits: 3, ws: ws).dup(2) * 0.1
