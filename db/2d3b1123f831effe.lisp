; mix ; expansion nests
(let ((l (f-sin-osc ar (mce2 100  500) 0))
      (r (f-sin-osc ar (mce2 5000 501) 0)))
  (mul 0.01 (mix (mce2 l r))))
