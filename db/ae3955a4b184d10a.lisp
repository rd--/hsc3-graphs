; mantissa-mask
(let ((s (mul (sin-osc ar (mul-add (sin-osc kr 0.2 0) 400 500) 0) 0.1)))
  (mantissa-mask s 3))
