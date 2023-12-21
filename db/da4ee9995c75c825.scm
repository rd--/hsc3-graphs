; 20060911 (rd)
(let* ((x (MouseX 0.03 0.12 1 0.1))
       (y (Mul (MouseY 0.01 0.52 1 0.1) 0.4))
       (n (lambda ()
	    (let ((t (Mul3
		      (Add (SinOsc (Rand 0.3 0.5) (Rand 0 pi)) 1)
		      (Impulse (MulAdd (LfNoise2 0.333) 11 11) 0)
		      0.5)))
	      (Ringz
	       (CoinGate (Lpz2 (Add4 0.05 (LfNoise0 2) y t)) t)
	       (TExpRand (Mce2 500 900) 1600 t)
	       x)))))
  (Mul
   (Clip2 (!+ n 3) (TRand 0 1 (Dust 8)))
   0.25))
