; Mrg2 ; Mrg2 defines a node indicating a multiple root graph ; there is a leftmost rule, so that mrg nodes need not be terminal
(let ((l (Mul (SinOsc 300 0) 0.1))
      (r (Out 1 (Mul (SinOsc 900 0) 0.1))))
  (Mrg2 l r))
