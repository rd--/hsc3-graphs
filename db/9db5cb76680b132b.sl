let z = WhiteNoise() * 0.1;
z + AllpassC(z, 0.01, XLine(0.0001, 0.01, 20), 0.2)
