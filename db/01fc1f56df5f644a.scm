; mousex
(Mce2 (Mul (SinOsc (MouseX 20 2000 1 0.1) 0)
           (MouseY 0.01 0.1 0 0.1))
      (Mul (SinOsc (MouseY 20 2000 1 0.1) 0)
           (MouseX 0.01 0.1 0 0.1)))
