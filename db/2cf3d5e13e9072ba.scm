; Mix ; multiple channel expansion and sum signals
(let ((f (list 600.2 622.0 641.3 677.7)))
  (Mul (Mix (FSinOsc f 0)) 0.02))
