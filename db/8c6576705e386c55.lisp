; linen ; mouse-x is gate
(let* ((y (mouse-y kr 0.01 0.1 0 0.1))
       (x (mouse-x kr -1 1 0 0.1)))
  (mul (sin-osc ar 440 0) (linen x 1 y 1.0 do-nothing)))
