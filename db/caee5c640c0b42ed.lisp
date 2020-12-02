; excess ; written out
(let ((a (f-sin-osc ar 1000 0))
      (b (line kr 0 1 8 do-nothing)))
  (mul (sub a (clip2 a b)) 0.1))
