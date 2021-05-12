; ring3
(let ((a (FSinOsc ar 800 0))
      (b (FSinOsc ar (XLine kr 200 500 5 do-nothing) 0)))
  (Mul (mce2 (Ring3 a b) (mul3 a a b)) 0.1))
