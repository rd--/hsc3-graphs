; VOsc3 ; requires=buf:0-7
(let ((p (MouseX 0 7 0 0.1))
      (f1 (list 240 241))
      (f2 (list 240.27 241.1))
      (f3 (list 240.43 239.71)))
  (Mul (VOsc3 p f1 f2 f3) 0.1))
