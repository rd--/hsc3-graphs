let z = Decay2(Impulse(1 / 4, 0), 0.01, 0.1) * PinkNoise();
[z, MultiTapDelay([0.5 1 1.9 2 4], [0.1 1 0.5 0.2 0], z)]
