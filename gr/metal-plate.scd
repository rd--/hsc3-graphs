// metal plate (jmcc)

{
	// number of delay lines
    var n = 4;
	// maximum delay time
	var maxdt = Server.default.sampleRate * 0.03;
    // allocate buffers for delay lines
    var buf = Array.fill(n, {LocalBuf.newFrom(Array.fill(maxdt,0));});
    // assign random tap times
    var tap_tm = Array.rand(n, 0.015, 0.03);
    // excitation
	var exc_freq = MouseY.kr(10, 8000);
	var exc_trig = Impulse.ar(0.5, 0, 0.2);
    var exc = Decay2.ar(exc_trig, 0.01, 0.2, LFNoise2.ar(exc_freq));
    // tap the delay lines
    var del = n.collect({arg i; Tap.ar(buf[i], 1, tap_tm[i])});
    // filter the taps
	var flt_freq = MouseX.kr(10, 5000);
    var flt = LPF.ar(del, flt_freq, 0.98);
    // write to delay lines
    n.do({arg i; RecordBuf.ar(flt[i] + exc,buf[i])});
    Mix.ar(flt);
}.play
