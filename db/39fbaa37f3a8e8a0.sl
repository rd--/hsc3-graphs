;; pond life (jmcc) #1 ; texture=overlap,8,8,4,inf ; requires=kr
var f = SinOsc(Rand(20, 50), 0) * Rand(100, 400) + LinRand(500, 2500, 0);
var o = SinOsc(f.kr, 0) * LfPulse(3 / Rand(1, 9), 0, Rand(0.2, 0.5)).kr * 0.04;
Pan2(o, Rand(-1, 1), 1)
