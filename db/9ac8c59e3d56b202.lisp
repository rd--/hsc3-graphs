; rand-seed ; graph with rand ugens
(let ((n (add (mul (white-noise ar) (mce2 0.05 0.05)) (dust2 ar (mce2 70 70))))
      (f (mul-add (lf-noise1 kr 3) 5500 6000)))
  (add (resonz (mul n 5) f 0.5) (mul n 0.1)))
