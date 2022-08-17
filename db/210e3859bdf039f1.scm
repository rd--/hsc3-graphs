; TChoose
(let* ((t (Dust (MouseX 1 1000 1 0.1)))
       (f (MidiCps (TIRand 48 60 t)))
       (a (Mce3
	   (SinOsc f 0)
           (Saw (Mul f 2))
           (Pulse (Mul f 0.5) 0.1))))
  (Mul (TChoose t a) 0.1))
