// MiBraids ; sample rate, bit reduction and distortion
{var trig =  CoinGate.kr(0.3, Impulse.kr(4));
 var decim = TRand.kr(1,32,trig);
 var dist = LFTri.kr(0.2).range(0,1);
 MiBraids.ar(40, 0.7, 0.7, 34, trig, resamp: 2, decim: decim, bits: 3, ws: dist, mul: 0.1) ! 2}
