; Mrg2 ; the leftmost node may be an mce node
(let ((l (Mul (SinOsc (Mce2 300 400) 0) 0.1))
      (r (Out 1 (Mul (SinOsc 900 0) 0.1))))
  (Mrg2 l r))
