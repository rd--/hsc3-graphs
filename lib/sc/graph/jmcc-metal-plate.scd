// metal plate (jmcc) #4
{var n = 4 // number of delay lines
;var maxdt = Server.default.sampleRate * 0.03 // maximum delay time
;var buf = Array.fill(n, {LocalBuf.new(maxdt,1).clear}) // allocate buffers for delay lines
;var tap_tm = Array.rand(n, 0.015, 0.03) // assign random tap times
;var exc_freq = MouseY.kr(10, 8000) // excitation
;var exc_trig = Impulse.ar(0.5, 0, 0.2)
;var exc = Decay2.ar(exc_trig, 0.01, 0.2, LFNoise2.ar(exc_freq))
;var del = n.collect({arg i; Tap.ar(buf[i], 1, tap_tm[i])}) // tap the delay lines
;var flt_freq = MouseX.kr(10, 5000) // filter the taps
;var flt = LPF.ar(del, flt_freq, 0.98)
;n.do({arg i; RecordBuf.ar(flt[i] + exc,buf[i])}) // write to delay lines
;Mix.ar(flt)}.play
