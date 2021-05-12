; resonant dust (jmcc) #2 ; texture=overlap,5,2,9,inf
(let* ((rf (let* ((st (Rand 80 2080))
                  (en (Add st (Mul (Rand -0.5 0.5) st))))
             (XLine kr st en 9 do-nothing)))
       (d (Mul (Dust ar (Rand 50 850)) 0.3)))
  (Pan2 (Resonz d rf 0.1) (Rand -1 1) 1))
