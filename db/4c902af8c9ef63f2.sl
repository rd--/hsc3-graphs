/* Lfo modulation (Jmcc) #1 */
let o = SinOsc(0.05, 0) * 80 + 160;
let p = SinOsc([0.6, 0.7], 0) * 3600 + 4000;
let s = Rlpf(LfPulse(o, 0, 0.4) * 0.05, p, 0.2);
CombL(s, 0.3, [0.2, 0.25], 2)
