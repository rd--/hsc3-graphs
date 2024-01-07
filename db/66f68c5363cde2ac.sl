let z = Decay2(Impulse(1 / 2, 0), 0.01, 0.1) * PinkNoise();
[z, MultiTapDelay([0.5 1.25 1.5], [0.1 1 0], z)]
