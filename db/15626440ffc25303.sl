var z = WhiteNoise() + SinOsc(800, 0) * 0.1;
LeakDc(Median(31, z), 0.9)
