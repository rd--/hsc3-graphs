/* Perc ; EnvGen of EnvPerc without level input ; c.f. Asr for gate variant */
let tr = Impulse(1, 0);
SinOsc(TRand(200, 500, tr), 0) * Perc(tr, 0.01, 1, -4) * 0.1
