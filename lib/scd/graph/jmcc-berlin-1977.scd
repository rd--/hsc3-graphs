// berlin 1977 (jmcc) #4
var sequ = { arg s, tr; Demand.kr(tr, 0, Dseq.dr(s, inf)) }; // somewhat akin to SC2 Sequencer
var sequR = { arg s, tr; Demand.kr(tr, 0, Dshuf.dr(s, inf)) }; // sequ with random selection function
var clockRate = MouseX.kr(5, 20, 'exponential', 0.2); // mouse x controls clock rate
var clockTime = 1 / clockRate;
var clock = Impulse.kr(clockRate, 0); // sequencer trigger
var patternList = #[55, 60, 63, 62, 60, 67, 63, 58];
var note = sequ.value(patternList, clock); // midi note pattern sequencer
var clock16 = PulseDivider.kr(clock, 16, 0); // divide clock by 16
var noteTrs = sequR.value([-12, -7, -5, 0, 2, 5], clock16) + note; // transpose somewhat randomly
var freq = noteTrs.midicps; // convert midi note to cycles per second
var env = Decay2.kr(clock, 0.05 * clockTime, 2 * clockTime);
var amp = env * 0.1 + 0.02; // amplitude envelope
var filt = env * (FSinOsc.kr(0.17, 0) * 800) + 1400; // filter frequency
var pw = SinOsc.kr(0.08, [0, 0.5 * pi]) * 0.45 + 0.5; // pulse width LFO(s)
var s = Pulse.ar(freq, pw) * amp;
CombN.ar(RLPF.ar(s, filt, 0.15), 0.2, [0.2, 0.17], 1.5)
