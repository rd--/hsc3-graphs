; tchoose
(let* ((t (Dust ar (MouseX kr 1 1000 1 0.1)))
       (f (MIDICPS (TIRand 48 60 t)))
       (a (Mce3 (SinOsc ar f 0)
                (Saw ar (Mul f 2))
                (Pulse ar (Mul f 0.5) 0.1))))
  (Mul (TChoose t a) 0.1))
