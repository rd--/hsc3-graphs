; FbSineC ; randomly modulate parameters
(let* ((x (MouseX 1 12 0 0.1))
       (f (lambda (m a) (MulAdd (LfNoise2 x) m a))))
  (Mul (FbSineC
                  (f 1e4 1e4)
                  (f 32 33)
                  (f 0.5 0)
                  (f 0.05 1.05)
                  (f 0.3 0.3)
                  0.1
                  0.1)
       0.1))
