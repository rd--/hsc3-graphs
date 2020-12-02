; linen
(let ((e (linen (impulse kr 2 0) 0.01 0.1 0.4 do-nothing)))
  (mul (sin-osc ar 440 0) e))
