; TWChoose
(let ((a (Mce3 (SinOsc 220 0)
               (Saw 440)
               (Pulse 110 0.1)))
      (t (Dust (MouseX 1 1000 1 0.1)))
      (w (Mce3 0.6 0.15 0.05)))
  (Mul (TWChoose t a w 1) 0.1))
