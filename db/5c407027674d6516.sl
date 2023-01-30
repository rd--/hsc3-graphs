;; Sw ; switch ; switch is gate
(1 .. 8).collect({ :i | SinOsc(110 * i, 0) * Asr(Sw(i), 0.01, 1, -4) * 0.1 }).Splay2
