; mrg2 ; the rightmost node may be an mce node ; here k-rate sinosc are not connected to anything
(let ((l (Mul (SinOsc ar (mce2 300 301) 0) 0.1))
      (r (SinOsc kr (mce2 1 (mce2 2 3)) 0)))
  (mrg2 l r))
