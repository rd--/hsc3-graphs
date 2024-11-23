/* http://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi) */
let amp = 2;
let tone = 340;
let tone2 = 189;
let snappy = 0.3;
let amp2 = 1;
let tr = Impulse(LfNoise2(1) + 1.5, 0);
let noiseEnv = Perc(tr, 0.001, 4.2, -115);
let atkEnv = Perc(tr, 0.001, 0.8, -95);
let noise = Lpf(Hpf(WhiteNoise(), 1800), 8850) * noiseEnv * snappy;
let osc1 = SinOsc(tone2, pi / 2) * 0.6;
let osc2 = SinOsc(tone, pi / 2) * 0.7;
let sum = (osc1 + osc2) * atkEnv * amp2;
Hpf(Pan2(noise + sum, 0, amp), 340)
