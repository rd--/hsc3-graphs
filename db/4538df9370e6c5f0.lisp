; cusp-n ; frequency control
(let* ((x (mouse-x kr 0.9 1.1 1 0.1))
       (y (mouse-y kr 1.8 2 1 0.1))
       (f (mul-add (cusp-n ar 40 x y 0) 800 900)))
  (mul (sin-osc ar f 0.0) 0.1))
