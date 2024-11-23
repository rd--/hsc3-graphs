/* Osc ; sineTable */
let c = 128.sineTable(1 / 1:3, [0]).normalizeSignal.asWavetable.asLocalBuf;
Osc(c, MouseX(222, 555, 1, 0.2), 0) * 0.1
