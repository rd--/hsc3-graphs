; mrg2 ; the leftmost node may be an mce node
(let ((l (Mul (SinOsc ar (mce2 300 400) 0) 0.1))
      (r (Out 1 (Mul (SinOsc ar 900 0) 0.1))))
  (mrg2 l r))
