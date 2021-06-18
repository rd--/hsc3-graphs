; Ceil
(let* ((x (MouseX kr 65 95 0 0.1))
       (f (MidiCps (Mce2 (Floor x) (Ceil x)))))
  (Mul (SinOsc ar f 0) 0.1))
