// panning a mono signal ; x = left channel, y = right channel ; jmcc
Pan2.ar(BrownNoise.ar, MouseX.kr(-1, 1, 0, 0.2), 0.1)
