; trkl (rd)
(let ((trkl
       (lambda (d ul fu dy la fy)
         (let* ((tf (XLine kr 1 ul d remove-synth))
                (st (Impulse ar (Mul tf 8) 0))
                (t  (Impulse ar tf 0))
                (a  (DbAmp (Line kr 12 la d remove-synth)))
                (f  (XLine kr fu 900 d remove-synth))
                (p  (Line kr (Rand -1 1) (Rand -1 1) d remove-synth))
                (fh (TRand 1.75 2.25 t)))
           (Pan2 (Add (mix (Ringz (Decay2 t 0.01 dy) (mce2 f (Mul f fh)) fy))
                      (mix (mul3 (Saw ar (mce2 f (Mul f fh)))
                                 (Decay2 t 0.1 (TRand 0.05 1.0 t))
                                 (TExpRand 0.001 0.25 st))))
                 p a)))))
  (trkl (Rand 0.5 16)
        (Rand 16 64)
        (Rand 1200 9000)
        (Rand 0.005 0.175)
        (Rand -60 -25)
        (Rand 0.015 0.125)))
