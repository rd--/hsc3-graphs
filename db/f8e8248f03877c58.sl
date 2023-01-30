;; Hpf
var c = Hpf(LfSaw(5, 0.1), MouseX(2, 200, 1, 0.2));
SinOsc(c * 200 + 400, 0) * 0.1
