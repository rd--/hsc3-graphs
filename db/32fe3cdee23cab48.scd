// Griot modeling ; mouse x controls damping, mouse y controls excitation ; Jmcc
var maxdt = 48000 * 0.03; // maximum delay time - Server.default.sampleRate
var n = 5; // number of delay lines
// allocate buffers for the delay lines
var buffers = Array.fill(n, {LocalBuf.newFrom(Array.fill(maxdt,0))});
// assign tap times which determine the string pitches
var tapTimes = Array.series(n, 0.003, 0.0005);
// excitation (simplified!)
var env = Env.new([0,1,0], [0.01, 0.2], -2);
var excitation = n.collect({
	arg i;
	LFNoise2.ar(MouseY.kr(10, 10000), EnvGen.kr(env,Impulse.kr(n,0),levelScale:0.1.rand)) *
	((Demand.kr(Impulse.kr(n,0),0,Dbrown(0,n-1,1,inf)) - i).abs < 1);
});
// tap the delay lines
var delayedSignals = n.collect({arg i; Tap.ar(buffers[i], 1, tapTimes[i])});
// filter the taps
var filteredDelays = LPF.ar(delayedSignals, MouseX.kr(10, 10000), 0.98);
// write to delay lines
n.do({arg i; RecordBuf.ar(filteredDelays[i] + excitation[i],buffers[i])});
Mix.ar(filteredDelays).dup;	// mix 5 channels to one
