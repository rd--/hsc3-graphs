// TLine ; linear ramp from 110 to 440 over 10 seconds, every 5 seconds ; reference tone in left channel
SinOsc.ar([440.0, TLine.kr(110, 440, 10, Impulse.kr(1/5, 0))], 0) * 0.1
