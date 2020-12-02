; bouncing-objects (jmcc #2)
(u:overlap-texture
 0.001 3 (/ 3.001 0.6)
  (lambda (tr)
    (let* ((t-line (lambda (rt st en du tr) (phasor rt tr (f-div 1 du) st en st)))
           (t-x-line (lambda (rt st en du tr) (lin-exp (t-line rt st en du tr) st en st en)))
           (t-rand-n (lambda (k l r tr) (clone k (lambda () (t-rand l r tr)))))
           (imp-frq (t-x-line kr (add 5 (t-rand -2 2 tr)) 600 4 tr))
           (imp-amp (t-x-line kr 0.09 0.000009 4 tr))
           (imp (mul (impulse ar imp-frq 0) imp-amp))
           (exc (decay imp 0.001))
           (flt-frq (t-rand-n 4 400 8400 tr))
           (flt-amp (t-rand-n 4 0 1 tr))
           (flt-rtm (t-rand-n 4 0.01 0.11 tr))
           (flt (dyn-klank exc 1 0 1 (klank-data-mce flt-frq flt-amp flt-rtm)))
           (loc (pan2 flt (t-rand -1 1 tr) 1))
           (e (env '(1 1 0) '(3 0.001) (replicate 2 'linear) -1 -1))
           (o (mul loc (env-gen kr tr 1 0 1 do-nothing e))))
      (delay-n o 1 (t-rand 0 1 tr)))))
