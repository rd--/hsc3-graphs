// RTLine ; linear ramp from 220 to 440 over 5 seconds, every 10 seconds
{SinOsc.ar(RTLine.kr(220,440,5,Impulse.kr(1/10,0)),0) * 0.1}
