; set-reset-ff
(let ((n (brown-noise ar))
      (g (set-reset-ff (dust ar 5) (dust ar 5))))
  (mul3 n g 0.1))
