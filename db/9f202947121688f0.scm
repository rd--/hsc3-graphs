; Mce2 ; channel layout is L=440,441 and R=660,661
(let ((f (Mce2 (Mce2 440 660) (Mce2 441 661))))
  (Mul (Mix (SinOsc f 0)) 0.1))
