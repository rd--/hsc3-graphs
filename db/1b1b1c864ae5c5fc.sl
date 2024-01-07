let z = Decay2(Dust(2), 0.01, 0.1) * PinkNoise();
[z, MultiTapDelay([0.1 0.2 0.3 0.4 1], [0.1 0.2 0.8 1 0], z)]
