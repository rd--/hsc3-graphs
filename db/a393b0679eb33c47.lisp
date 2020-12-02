; fb-sine-c ; randomly modulate parameters
(let* ((x (mouse-x kr 1 12 0 0.1))
       (f (lambda (m a) (mul-add (lf-noise2 kr x) m a))))
  (mul (fb-sine-c ar
                  (f 1e4 1e4)
                  (f 32 33)
                  (f 0.5 0)
                  (f 0.05 1.05)
                  (f 0.3 0.3)
                  0.1
                  0.1)
       0.1))
