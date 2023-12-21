; bowed string (jmcc) ; texture=overlap,5,2,12,inf
(let* ((root 5)
       (scale (map (lambda (n) (+ n root)) (list 0 2 4 5 7 9 11)))
       (oct (list 24 36 48 60 72 84))
       (choose (lambda (l) (kr: (Select (IRand 0 (length l)) l))))
       (f (MidiCps (Add (choose scale) (choose oct))))
       (x (Mul3
	   (BrownNoiseN 2)
	   0.007
	   (Max 0 (MulAdd (LfNoise1 (ExpRand 0.125 0.5)) 0.6 0.4))))
       (d (klankData
	   ((series-with Add) 12 f f)
	   ((series-with Mul) 12 1 (Rand 0.7 0.9))
	   (RandN 12 1.0 3.0))) ; rsc3-lang:series-with
       (k (Klank x 1 0 1 d)))
  (SoftClip (Mul k 0.1)))
