; VOsc ; requires=buf:0-7 ; c.f. VOsc3
(let ((b (MouseX 0 7 0 0.1))
      (f (list 120 121)))
  (Mul (VOsc b f 0) 0.1))
