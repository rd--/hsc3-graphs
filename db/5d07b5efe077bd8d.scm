; doppler (jmcc)
(let* ((doppler
	(lambda (xy s)
	  (let* ((d (Hypot (car xy) (cdr xy)))
		 (a (Div 40 (Squared d)))
		 (maxD 110))
	    (Mul (DelayL s (Div maxD 344) (Div d 344)) a))))
       (lineX
	(lambda (x y dt)
	  (cons x (Ln (Neg y) y dt))))
       (ellipse
	(lambda (a b dt)
	  (let ((t (Line (Neg twoPi) (Mul pi 1.5) dt removeSynth)))
	    (cons (Mul a (Cos t)) (Mul b (Sin t))))))
       (src (Rlpf (Mul (FSinOsc 200 0) (LfPulse 31.3 0 0.4)) 400 0.3)))
  (Mce2 (doppler (lineX 10 100 6) src)
	(doppler (ellipse 10 75 12) src)))
