let w = ControlOut(0, SinOsc([3 5 7 9] / 11, 0).Range(0, 1).kr);
SinOsc(ControlIn(1, [0 .. 3]) * 333 + 55, 0).Splay * 0.1 <! w
