// mouse clatter
{var b = LocalBuf(2048,1)
;var x = MouseX.kr(100,12000,'linear',0.1)
;var y = MouseY.kr(0.01,0.15,'linear',0.1)
;var n1 = LFNoise0.kr([3,3.25])
;var t = Impulse.kr((n1 * 16) + 18,0)
;var n2 = TRand.kr(0.005,y,t)
;var n3 = WhiteNoise.ar
;var n4 = TRand.kr(10,x,t)
;var n5 = TRand.kr(0,1,t)
;var n6 = TExpRand.kr(0.15,1,t)
;var o = {var e = Decay2.kr(t,0.01,n2)
         ;BPF.ar(n3 * e,n4,n5)}
;var n7 = PV_RandComb(FFT(b,o),n6,t)
;(o * 0.05) + IFFT(n7)}
