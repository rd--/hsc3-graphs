; mce ; channel layout is L=440,441 and R=660,661
(let ((f (Mce2 (Mce2 440 660) (Mce2 441 661))))
  (Mul (Mix (SinOsc ar f 0)) 0.1))
