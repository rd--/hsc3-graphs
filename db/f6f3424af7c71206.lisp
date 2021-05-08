; chrd (rd)
(mix-fill
 5
 (lambda (_)
   (let* ((m (make-mce (list 60 65 72 77 79 84)))
          (ds 3)
          (d (make-mce (map (lambda (x) (* x ds)) (list 5 4 5 7 4 5))))
          (l (XLine kr m (Add m (Rand 0.05 0.5)) d do-nothing))
          (f (MIDICPS l))
          (z (env-trapezoid 0 (Rand 0.15 0.35) d (Rand 0.005 0.01)))
          (e (EnvGen kr 1 1 0 1 do-nothing z))
          (p (XLine kr (Rand -1 1) (Rand -1 1) d do-nothing))
          (o (FSinOsc ar f 0)))
     (mix (Pan2 o p e)))))
