// GravityGrid ; 48k spectrum looping
Pan2.ar(Resonz.ar(GravityGrid.ar(Impulse.kr(5, 0), 0.01, LFNoise0.kr(1) * 4, LFNoise0.kr(1) * 4, -1), 1000, 0.1), 0, 0.25)
