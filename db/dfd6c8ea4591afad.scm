; Demand
(let* ((mirror1 (lambda (l) (append l (cdr (reverse (cdr l))))))
       (t (Impulse 24 0))
       (s (Drand
	   dinf
	   (Mce2
	    (Dseq 1 (mirror1 (enumFromTo 1 5)))
            (Drand 8 (enumFromTo 4 11)))))
       (f (Demand t 0 (Mul s 100)))
       (x (MouseX -1 1 0 0.1))
       (o (SinOsc (Mce2 f (Add f 0.7)) 0)))
  (Mul (ScaleNeg (Cubed (Cubed o)) x) 0.1))
