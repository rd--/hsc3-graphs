// TLine ; linear ramp from 220 to 110 over 2 seconds, every 4 seconds
SinOsc.ar(TLine.kr(220,110,2,Impulse.kr(1/4,0)),0) * 0.1
