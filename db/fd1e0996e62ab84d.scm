; indexl
(let* ((b (asLocalBuf 1 (list 2 1 5 3 4 0)))
       (x (MouseX kr 0 (BufFrames kr b) linear 0.2))
       (f (MulAdd (IndexL b x) 100 40)))
  (Mul (Saw ar (Mul f (Mce2 1 1.1))) 0.1))
