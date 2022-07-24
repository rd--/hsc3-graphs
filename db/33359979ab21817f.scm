; Mrg2 ; the rightmost node may be an mce node ; here k-rate sinosce not connected to anything
(let ((l (Mul (SinOsc (Mce2 300 301) 0) 0.1))
      (r (SinOsc (Mce2 1 (Mce2 2 3)) 0)))
  (Mrg2 l r))
