// https://www.listarc.bham.ac.uk/lists/sc-users/msg21360.html
{var b = Array.fill(2,{LocalBuf(48000,1)}) // s.sampleRate
;var del = [0.2,0.3,0.4,0.5] * Rand(0.15,0.35)
;var loc = [-1,-0.7,0.6,1]
;var hpf = [Rand(300,600),Rand(900,1200)]
;var avg = [8000,14000]
;var sdt = [300,400]
;var lpf = [Rand(4300,4500),Rand(4000,4200)]
;var sr = SampleRate.ir
;var local = LocalIn.ar(2)
;var sig = Line.kr(0,1,0.1) * WhiteNoise.ar(0.03)
;var ph = DelTapWr.ar(b,sig + local)
;var fb = DelTapRd.ar(b,ph,del)
;var p_fb = Pan2.ar(fb,loc).sum
;var h_fb = HPF.ar(p_fb,hpf)
;var ao = AverageOutput.ar(abs(h_fb),Impulse.kr((avg / sr).reciprocal))
;var n_fb = h_fb * (0.02 / (Lag.ar(ao,sdt / sr).clip(0.0001,1)))
;var l_fb = LPF.ar(n_fb,lpf)
;LocalOut.ar(l_fb)
;l_fb}
