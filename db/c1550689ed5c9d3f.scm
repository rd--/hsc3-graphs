; h-chatter (rd)
(let*
  ((wrp
    (lambda (i l r)
      (let ((m (FDiv (Sub r l) 2)))
        (MulAdd i m (Add l m)))))
   (h0
    (let* ((n (MulAdd (LFNoise0 kr 1) 5 5))
           (a (MulAdd (LFNoise2 kr n) 0.20 1.20))
           (b (MulAdd (LFNoise2 kr n) 0.15 0.15))
           (f (lin-lin (LFNoise2 kr 4) -1 1 5 65))
           (h (HenonN ar (mce2 f (Mul f 0.5)) a b 0 0)))
      (Mul (Saw ar (MulAdd h 3200 1600)) 0.35)))
   (h1
    (let* ((n0 (LFNoise0 ar 32))
           (n1 (LFNoise0 ar 2))
           (x (MouseX kr 1.2 1.4 0 0.1))
           (y (MouseY kr 0.2 0.3 0 0.1))
           (h (wrp n0 1 32))
           (p (wrp n1 2400 3200))
           (l (wrp n1 -0.75 0.75))
           (g (wrp n1 0.55 0.85))
           (f 40)
           (o (Blip ar (wrp (HenonN ar f x y 0 0) p (Mul p 2)) h)))
      (Mul (Pan2 o l g) 0.35))))
  (Mul (Add h0 h1) 0.1))
