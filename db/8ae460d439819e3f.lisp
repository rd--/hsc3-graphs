; lag3
(let* ((x (mouse-x kr 220 440 0 0.1))
       (f (mce2 x (lag3 x 1))))
  (mul (sin-osc ar f 0) 0.1))