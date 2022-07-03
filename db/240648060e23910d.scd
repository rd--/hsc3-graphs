// GravityGrid
Pan2.ar(0.5 * GravityGrid.ar(Impulse.kr(1, 0), SinOsc.kr(0.5, 0) * 0.8 + 1,LFSaw.kr(50, 0), LFNoise0.kr(10) * 0.8, -1), 0, 0.05)
