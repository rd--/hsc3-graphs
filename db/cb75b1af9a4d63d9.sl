let counter = PinkNoise() * Decay(Impulse(1, 0), 0.1) * 0.1;
Release(SinOsc(440, 0) * 0.1, 3, 3, 5) + counter
