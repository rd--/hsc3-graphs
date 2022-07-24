; AmpComp ; Amplitude compensation In frequency modulation
(let* ((x (MouseX 300 15000 1 0.1))
       (y (MouseY 3 200 1 0.1))
       (m (Mul x (MulAdd (SinOsc y 0) 0.5 1)))
       (a (AmpComp m 300 0.333)))
  (Mul3 (SinOsc m 0) 0.1 a))
