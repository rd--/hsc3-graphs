(* Sample and hold *)
let i = Latch(LfSaw(MouseX(1.1, 30, 0, 0.2), 0) * 5 + 5, Impulse(10, 0));
PmOsc(300, 356, i, 0) * 0.1
