; rm-octaver (andrea valle, miller puckette)
(let* ((default-pitch
	 (lambda (i)
	   (Pitch i 440 60 4000 100 16 1 0.01 0.5 1 0)))
       (i (SoundIn 0))
       (p (default-pitch i))
       (f (mceChannel p 0)))
  (MulAdd (SinOsc (Mul f 0.5) 0) i i))
