; Floor
(let* ((x (MouseX 65 95 0 0.1))
       (f (MidiCps (Floor x))))
  (Mul (SinOsc f 0) 0.05))
