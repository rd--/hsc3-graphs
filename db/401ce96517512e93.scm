; floor
(let* ((x (MouseX kr 65 95 0 0.1))
       (f (MidiCps (Floor x))))
  (Mul (SinOsc ar f 0) 0.05))
