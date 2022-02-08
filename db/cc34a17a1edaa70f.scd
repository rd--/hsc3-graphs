// TLine ; reset end randomly every 4 seconds, start is previous end, ramp every trigger ; c.f. TLineTo
var trig = Impulse.kr(1/4, 0);
var f1 = TExpRand.kr(110, 440, TDelay.kr(trig, ControlDur.ir));
var f0 = Latch.kr(f1, trig);
SinOsc.ar(TLine.kr(f0, f1, 4, trig), 0) * 0.1
