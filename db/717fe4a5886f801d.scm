; analog bubbles {mouse} (jmcc) #1
(let* ((y (MouseY kr 0.1 10 exponential 0.2))
       (x (MouseX kr 2 40 exponential 0.2))
       (o (MulAdd (LFSaw kr x 0) -3 80))
       (f (MulAdd (LFSaw kr y 0) 24 o))
       (s (Mul (SinOsc ar (MidiCps f) 0) 0.04)))
  (CombN s 0.2 0.2 4))
