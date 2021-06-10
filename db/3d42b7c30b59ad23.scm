; AmpComp ; Amplitude compensation In frequency modulation
(let* ((x (MouseX kr 300 15000 1 0.1))
       (y (MouseY kr 3 200 1 0.1))
       (m (Mul x (MulAdd (SinOsc ar y 0) 0.5 1)))
       (a (AmpComp kr m 300 0.333)))
  (Mul3 (SinOsc ar m 0) 0.1 a))
