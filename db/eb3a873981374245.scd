// RTXLine ; exponential ramp from 220 to 440 over 5 seconds, every 10 seconds
{SinOsc.ar(freq: RTXLine.kr(start: 220, end: 440, dur: 5, trig: Impulse.kr(freq: 1/10, phase: 0)), phase: 0) * 0.1}
