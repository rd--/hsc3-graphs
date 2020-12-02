; mrg2 ; the leftmost node may be an mce node
(let ((l (mul (sin-osc ar (mce2 300 400) 0) 0.1))
      (r (out 1 (mul (sin-osc ar 900 0) 0.1))))
  (mrg2 l r))
