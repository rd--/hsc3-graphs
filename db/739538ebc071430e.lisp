; xy-interference (rd)
(let* ((x (MouseX kr 20 22000 1 (mce2 0.005 0.025)))
       (y (MouseY kr 20 22000 1 (mce2 0.005 0.075)))
       (nd (lambda (_)
             (let* ((n (LFNoise0 kr (mce2 5 9)))
                    (a (SinOsc ar (Add x n) 0))
                    (b (SinOsc ar y 0)))
               (Mul a b)))))
  (Mul (mix-fill 3 nd) 0.1))
