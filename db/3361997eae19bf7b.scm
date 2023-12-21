; 20060909 (rd)
(let* ((mk-n (lambda (freq) (kr: (LfNoise0 freq))))
       (mk-p
        (lambda ()
          (let* ((x (MouseX 0.001 0.02 1 0.1))
                 (y (MouseY 120 400 1 0.1))
                 (f (Mul (mk-n 4) (Mce2 32 64)))
                 (w (Mul (mk-n 32) x)))
            (Mul
	     (Resonz
	      (Pulse f w)
              (Add y (Mul (mk-n 2) 0.1))
              (MulAdd (mk-n 6) 0.4 0.8))
             0.5))))
       (q (CombN
	   (mk-p)
           0.2
           (MulAdd (mk-n 128) 0.1 0.1)
           3))
       (r (let* ((x (MouseX 0.75 1.25 1 0.1))
                 (y (MouseY 0.25 1 1 0.1))
                 (f (lambda ()
                      (Mul
		       (SinOsc (Mul x (Rand 50 59)) 0)
                       (Mul y (Rand 0.04 0.16))))))
            (Mce2
	     (!+ f 16)
             (!+ f 12)))))
  (Add3 (mk-p) q r))
