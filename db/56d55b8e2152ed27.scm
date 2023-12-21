; analog bubbles {mouse} (jmcc) #1
(let* ((y (MouseY 0.1 10 exponential 0.2))
       (x (MouseX 2 40 exponential 0.2))
       (o (MulAdd (LfSaw x 0) -3 80))
       (f (MulAdd (LfSaw y 0) 24 o))
       (s (Mul (SinOsc (MidiCps f) 0) 0.04)))
  (CombN s 0.2 0.2 4))
