;; Sw ; switch ; turn oscillator on and off
(1 .. 8).collect({ :i | SinOsc(110 * i, 0) * Sw(i) * 0.1 }).Splay2
