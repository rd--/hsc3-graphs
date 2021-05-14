// sample and hold liquidities (jmcc) #4
val clockRate = MouseX.kr(1, 200, 1, 0.1);
val clockTime = clockRate.reciprocal;
val clock = Impulse.kr(clockRate, 9) * 0.4;
val centerFreq = MouseY.kr(100, 8000, 1, 0.1);
val freq = Latch.kr(WhiteNoise.kr * centerFreq * 0.5 + centerFreq, clock);
val panPos = Latch.kr(WhiteNoise.kr, clock);
val sig = Pan2.ar(SinOsc.ar(freq, 0) * Decay2.kr(clock, 0.1 * clockTime, 0.9 * clockTime), panPos, 1);
CombN.ar(sig, 0.3, 0.3, 2)
