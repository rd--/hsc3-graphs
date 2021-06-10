; bouncing-objects (jmcc #2)
(overlapTextureGraph
 0.001 3 (/ 3.001 0.6)
  (lambda (tr)
    (let* ((t-line (lambda (rt st en du tr) (Phasor rt tr (FDiv 1 du) st en st)))
           (t-xline (lambda (rt st en du tr) (LinExp (t-line rt st en du tr) st en st en)))
           (t-randn (lambda (k l r tr) (mceFill k (lambda (_) (TRand l r tr)))))
           (imp-frq (t-xline kr (Add 5 (TRand -2 2 tr)) 600 4 tr))
           (imp-amp (t-xline kr 0.09 0.000009 4 tr))
           (imp (Mul (Impulse ar imp-frq 0) imp-amp))
           (exc (Decay imp 0.001))
           (flt-frq (RTRandN 4 400 8400 tr))
           (flt-amp (RTRandN 4 0 1 tr))
           (flt-rtm (RTRandN 4 0.01 0.11 tr))
           (flt (DynKlank exc 1 0 1 (klankDataMce flt-frq flt-amp flt-rtm)))
           (loc (Pan2 flt (TRand -1 1 tr) 1))
           (e (env '(1 1 0) '(3 0.001) (replicate 2 'linear) -1 -1))
           (o (Mul loc (EnvGen kr tr 1 0 1 doNothing e))))
      (DelayN o 1 (TRand 0 1 tr)))))
