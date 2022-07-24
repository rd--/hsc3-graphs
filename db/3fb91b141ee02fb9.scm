; resonant dust (jmcc) #2 ; texture=overlap,5,2,9,inf
(let* ((st (Rand 80 2080))
       (en (MulAdd (Rand2 0.5) st st))
       (rf (XLine st en 9 doNothing))
       (d (Mul (Dust (Rand 50 850)) 0.3)))
  (Pan2 (Resonz d rf 0.1) (Rand2 1) 1))
