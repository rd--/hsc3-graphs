;; Rlpf
var ctl = Rlpf(LfSaw(5, 0) * 0.1, 25, 0.03);
SinOsc(ctl * 200 + 400, 0) * 0.1
