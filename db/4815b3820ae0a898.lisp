; why supercollider (jmcc) #0
(let* ((s (mix-fill 10 (lambda (_) (resonz (mul (dust ar 0.2) 50) (rand 200 3200) 0.003))))
       (z (delay-n s 0.048 0.048))
       (y (mix-fill 7 (lambda (_) (comb-l z 0.1 (mul-add (lf-noise1 kr (rand 0 0.1)) 0.04 0.05) 15))))
       (f (lambda (i) (allpass-n i 0.05 (rand-n 2 0 0.05) 1)))
       (x ((foldl1 compose (replicate 4 f)) y)))
  (add s (mul x 0.2)))
