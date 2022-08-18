// mouse clatter
var b = LocalBuf.ir(2048, 1);
var x = MouseX.kr(100, 12000, 'linear', 0.1);
var y = MouseY.kr(0.01, 0.15, 'linear', 0.1);
var t = Impulse.kr((LFNoise0.kr([3, 3.25]) * 16) + 18, 0);
var e = Decay2.kr(t, 0.01, TRand.kr(0.005, y, t));
var o = BPF.ar(WhiteNoise.ar * e, TRand.kr(10, x, t), TRand.kr(0, 1, t));
var p = PV_RandComb(FFT.kr(b, o, 0.5, 0, 1, 0), TExpRand.kr(0.15, 1, t), t);
(o * 0.05) + IFFT.ar(p)
