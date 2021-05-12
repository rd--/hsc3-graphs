; tw-choose
(let ((a (mce3 (SinOsc ar 220 0)
               (Saw ar 440)
               (Pulse ar 110 0.1)))
      (t (Dust ar (MouseX kr 1 1000 1 0.1)))
      (w (mce3 0.6 0.15 0.05)))
  (Mul (tw-choose t a w 1) 0.1))
