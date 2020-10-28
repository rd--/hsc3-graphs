// berlin 1977 (jmcc) #4
{var sequ = {arg s,tr; Demand.kr(tr,0,Dseq(s,inf))} // somewhat akin to SC2 Sequencer
;var sequR = {arg s,tr; Demand.kr(tr,0,Dshuf(s,inf))} // sequ with random selection function
;var clock_rate = MouseX.kr(5,20,'exponential',0.2) // mouse x controls clock rate
;var clock_time = 1 / clock_rate
;var clock = Impulse.kr(clock_rate,0) // sequencer trigger
;var patternList = [55,60,63,62,60,67,63,58]
;var note = sequ.(patternList,clock) // midi note pattern sequencer
;var clock_16 = PulseDivider.kr(clock,16,0) // divide clock by 16
;var note_ = sequR.([-12,-7,-5,0,2,5],clock_16) + note // transpose somewhat randomly
;var freq = note_.midicps // convert midi note to cycles per second
;var env = Decay2.kr(clock,0.05 * clock_time,2 * clock_time)
;var amp = env * 0.1 + 0.02 // amplitude envelope
;var filt = env * (FSinOsc.kr(0.17,0) * 800) + 1400 // filter frequency
;var pw = SinOsc.kr(0.08,[0,0.5 * pi]) * 0.45 + 0.5 // pulse width LFO(s)
;var s = Pulse.ar(freq,pw) * amp
;CombN.ar(RLPF.ar(s,filt,0.15),0.2,[0.2,0.17],1.5)}.play

