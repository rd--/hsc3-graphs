// jmcc ; http://www.iamas.ac.jp/~aka/dspss2004/materials/
var freq = 80;
var trig = Impulse.kr(4, 0) * 0.05;
var f = Lag.kr(freq * Latch.kr((WhiteNoise.kr * 3 + 3).round(0.5) + 1, trig), 0.03);
var z = (VarSaw.ar(f * [1, 1.004, 1.505, 1.499], 0, MouseY.kr(0, 1, 0, 0.2)) * Decay2.kr(trig, 0.005, 1.4)).clump(2).sum;
CombN.ar(z * 0.5, 0.375, 0.375, 4).softclip
