; pv_conformalmap
(let* ((signal (lambda (n)
		 (let* ((o (SinOsc kr (mixFill n (lambda (_) (Rand 0.1 0.5))) 0))
			(a (Mul (asMce (list 1 1.1 1.5 1.78 2.45 6.7)) 220))
			(f (MulAdd o 10 a)))
		   (Mix (Mul (LFSaw ar f 0) 0.3)))))
       (mapped (lambda (n)
		 (let* ((c0 (fftDefaults (LocalBuf 1 2048) (signal n)))
			(x (MouseX kr 0.01 2.0  1.0 0.1))
			(y (MouseY kr 0.01 10.0 1.0 0.1))
			(c1 (PV_ConformalMap c0 x y)))
		   (ifftDefaults c1))))
       (s (mapped 3))
       (t (MulAdd (CombN s 0.1 0.1 10) 0.5 s)))
  (Pan2 t 0 0.25))
