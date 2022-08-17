; Mix ; expansion nests ; L=100,5000 R=500,501
(let ((l (FSinOsc (Mce2 100  500) 0))
      (r (FSinOsc (Mce2 5000 501) 0)))
  (Mul 0.01 (Mix (Mce2 l r))))
