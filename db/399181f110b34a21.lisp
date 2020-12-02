; standard-l ; frequency control
(let* ((x (mouse-x kr 0.9 4 0 0.1))
       (f (mul-add (standard-l ar 40 x 0.5 0) 800 900)))
  (mul (sin-osc ar f 0) 0.05))
