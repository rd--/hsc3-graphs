// griot modeling (jmcc)
{var maxdt = 48000 * 0.03 // maximum delay time -- Server.default.sampleRate
;var n = 5 // number of delay lines
;var buf = Array.fill(n,{LocalBuf.newFrom(Array.fill(maxdt,0))}) // allocate buffers for delay lines
;var tapTimes = Array.series(n, 0.003, 0.0005) // assign tap times which determine the string pitches
;var exc = n.collect(
 {arg i
 ;var exc_env = Env.new([0,1,0], [0.01, 0.2], -2) // excitation (brownian, jmcc has melody...)
 ;var exc_trig = Impulse.kr(n,0)
 ;var exc_ch = Demand.kr(exc_trig,0,Dbrown(0,n-1,1,inf))
 ;var exc_fr = MouseY.kr(10, 10000)
 ;var exc_sg = LFNoise2.ar(exc_fr, EnvGen.kr(exc_env, exc_trig, 0.1.rand))
 ;exc_sg * ((exc_ch - i).abs < 1)})
;var del = n.collect({arg i; Tap.ar(buf[i], 1, tapTimes[i])}) // tap the delay lines
;var flt = LPF.ar(del, MouseX.kr(10, 10000), 0.98) // filter the taps
;n.do({arg i; RecordBuf.ar(flt[i] + exc[i],buf[i])}) // write to delay lines
;Mix.ar(flt).dup}
