// Metal plate ;  mouse x controls damping, mouse y controls excitation ; Jmcc
var n = 4; // number of delay lines
var maxdt = 48000 * 0.03; // maximum delay time -- Server.default.sampleRate
// allocate buffers for the delay lines
var buffers = Array.fill(n, {LocalBuf.newFrom(Array.fill(maxdt,0))});
// assign random tap times
var tapTimes = Array.rand(n, 0.015, 0.03);
// excitation
var excitation = Decay2.ar(Impulse.ar(0.5, 0, 0.2), 0.01, 0.2, LFNoise2.ar(MouseY.kr(10, 8000)));
// tap the delay lines
var delayedSignals = n.collect({arg i; Tap.ar(buffers[i], 1, tapTimes[i])});
// filter the taps
var filteredDelays = LPF.ar(delayedSignals, MouseX.kr(10, 5000), 0.98);
// write to delay lines
n.do({arg i; RecordBuf.ar(filteredDelays[i] + excitation,buffers[i])});	// write the mixed signal to the delay line
Mix.ar(filteredDelays);	// mix 5 channels to one
