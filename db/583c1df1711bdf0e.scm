; mousex
(mce2 (Mul (SinOsc ar (MouseX kr 20 2000 1 0.1) 0)
           (MouseY kr 0.01 0.1 0 0.1))
      (Mul (SinOsc ar (MouseY kr 20 2000 1 0.1) 0)
           (MouseX kr 0.01 0.1 0 0.1)))
