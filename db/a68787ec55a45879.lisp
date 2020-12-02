; mrg2 ; mrg2 defines a node indicating a multiple root graph ; there is a leftmost rule, so that mrg nodes need not be terminal
(let ((l (mul (sin-osc ar 300 0) 0.1))
      (r (out 1 (mul (sin-osc ar 900 0) 0.1))))
  (mrg2 l r))
