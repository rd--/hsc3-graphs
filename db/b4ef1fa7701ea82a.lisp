; mix ; expansion nests
(let ((l (FSinOsc ar (mce2 100  500) 0))
      (r (FSinOsc ar (mce2 5000 501) 0)))
  (Mul 0.01 (mix (mce2 l r))))
