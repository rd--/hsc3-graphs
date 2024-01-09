// https://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi)
var amp = 2;
var tone = 340;
var tone2 = 189;
var snappy = 0.3;
var amp2 = 1;
var tr = Impulse.kr(LFNoise2.kr(1) + 1.5, 0);
var noiseEnv = Env.perc(0.001, 4.2, 1, -115).kr(0, tr);
var atkEnv = Env.perc(0.001, 0.8, 1, -95).kr(0, tr);
var noise, osc1, osc2, sum;
noise = WhiteNoise.ar;
noise = HPF.ar(noise, 1800);
noise = LPF.ar(noise, 8850);
noise = noise * noiseEnv * snappy;
osc1 = SinOsc.ar(tone2, pi/2) * 0.6;
osc2 = SinOsc.ar(tone, pi/2) * 0.7;
sum = (osc1 + osc2) * atkEnv * amp2;
HPF.ar(Pan2.ar(noise + sum, 0, amp), 340)
