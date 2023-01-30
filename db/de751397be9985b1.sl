;; Sw ; switch ; turn oscillator (with amplitude lfo) on and off
(1 .. 8).collect({ :i | SinOsc(110 * i, 0) * Sw(i) * SinOsc(0.05, i * pi / 4) * 0.1 }).Splay2
