/* PmOsc ; Carrier and modulator not linked */
let tr = Impulse(10, 0);
let c = TRand(100, 5000, tr);
let m = TRand(100, 5000, tr);
PmOsc(c, m, 12, 0) * 0.1
