; 20061027 (rd)
(let*
    ((wrp
      (lambda (i l r)
	(let ((m (Div (Sub r l) 2)))
          (MulAdd i m (Add l m)))))
     (h0
      (let* ((n (MulAdd (LfNoise0 1) 5 5))
             (a (MulAdd (LfNoise2 n) 0.20 1.20))
             (b (MulAdd (LfNoise2 n) 0.15 0.15))
             (f (LinLin (LfNoise2 4) -1 1 5 65))
             (h (HenonN (Mce2 f (Mul f 0.5)) a b 0 0)))
	(Mul (Saw (MulAdd h 3200 1600)) 0.35)))
     (h1
      (let* ((n0 (LfNoise0 32))
             (n1 (LfNoise0 2))
             (x (MouseX 1.2 1.4 0 0.1))
             (y (MouseY 0.2 0.3 0 0.1))
             (h (wrp n0 1 32))
             (p (wrp n1 2400 3200))
             (l (wrp n1 -0.75 0.75))
             (g (wrp n1 0.55 0.85))
             (f 40)
             (o (Blip (wrp (HenonN f x y 0 0) p (Mul p 2)) h)))
	(Mul (Pan2 o l g) 0.35))))
  (Mul (Add h0 h1) 0.1))