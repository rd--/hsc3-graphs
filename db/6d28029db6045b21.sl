;; Sw ; switch ; switch is trigger
(1 .. 8).collect({ :i | SinOsc(110 * i, 0) * Decay(Trig(Sw(i), 0.001), 1) * 0.1 }).Splay2
