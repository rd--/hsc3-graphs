; rm-octaver (andrea valle, miller puckette)
(let* ((default-pitch
	 (lambda (i)
	   (Pitch i 440 60 4000 100 16 1 0.01 0.5 1 0)))
       (i (sound-in 0))
       (p (default-pitch i))
       (f (mce-channel p 0)))
  (MulAdd (SinOsc ar (Mul f 0.5) 0) i i))
