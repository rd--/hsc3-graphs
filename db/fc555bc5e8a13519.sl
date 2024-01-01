var z = Decay(Dust(1) * 0.5, 0.3) * WhiteNoise();
DelayC(z, 0.2, 0.2) + z
