; random panning sines (jmcc) #1 ; texture=overlap,8,8,2,inf
(let ((mk-nd
       (lambda ()
         (let ((o (FSinOsc ar (LinRand 80 2000 0) 0))
               (l (LFNoise1 kr (Rand 0.8 1.2)))
               (a (LFNoise1 kr (Rand 0.82 0.98))))
           (Pan2 o l a)))))
  (Mul (mix (clone 8 mk-nd)) (/ 0.4 8)))
