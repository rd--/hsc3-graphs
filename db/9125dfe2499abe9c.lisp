; reverberated noise bursts (jmcc) #3
(let* ((useq (lambda (n f) (foldl1 compose (replicate n f))))
       (s (mul (decay (mul (dust ar 0.6) 0.2) 0.15) (pink-noise ar)))
       (z (delay-n s 0.048 0.048))
       (y (mix (comb-l z 0.1 (mul-add (lf-noise1 kr (rand-n 6 0 0.1)) 0.04 0.05) 15)))
       (f (useq 4 (lambda (i) (allpass-n i 0.050 (rand-n 2 0 0.05) 1)))))
  (add s (f y)))
