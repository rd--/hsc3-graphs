// moto rev (jmcc) #1
{var f = SinOsc.kr(0.2, 0) * 10 + 21
;var s = LFPulse.ar(f, [0, 0.1], 0.1)
;RLPF.ar(s, 100, 0.1).clip2(0.4)}.play
