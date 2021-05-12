; slly-walk (rd)
(let* ((o1
        (let* ((t (Dust kr 2))
               (e (env-bp-linear (list 0 0 (TRand 0.05 0.5 t) 1 1 0) 1 1))
               (d (TRand 0.15 0.25 t))
               (a (EnvGen kr t (TRand 0.02 0.04 t) 0 d do-nothing e))
               (p (EnvGen kr t (TRand 1.0 2.0 t) -1.0 d do-nothing e))
               (n (t-choose t (mce4 0 2 5 7)))
               (o 72))
          (Pan2 (SinOsc ar (MIDICPS (Add n o)) 0) p a)))
       (shft
        (lambda ()
          (let* ((t (Impulse kr 12 0))
                 (e (env-bp-linear (list 0 0 (TRand 0.25 1.0 t) 1 1 0) 1 1))
                 (d (TRand 0.05 0.125 t))
                 (a (EnvGen kr t (TRand 0.02 0.04 t) 0 d do-nothing e))
                 (p (EnvGen kr t (TRand 1.0 2.0 t) -1.0 d do-nothing e))
                 (n (t-choose t (make-mce (list 0 0 5 7 7 12 12 19))))
                 (o (Add 84 (Mul (ToggleFF t) 12))))
            (Pan2 (Saw ar (MIDICPS (Add n o))) p a))))
       (o2
        (Mul (Sum3 (shft) (shft) (shft)) 0.1))
       (o3
        (let* ((t (Impulse kr 6 0))
               (e (env-bp-linear (list 0 0 (TRand 0.25 1.0 t) 1 1 0) 1 1))
               (d (TRand 0.05 0.25 t))
               (a (EnvGen kr t (TRand 0.01 0.02 t) 0 d do-nothing e))
               (p (EnvGen kr t (TRand 1.0 2.0 t) -1.0 d do-nothing e))
               (n (Demand t 0 (Dibrown dinf 0 7 1)))
               (o 52)
               (b (as-local-buf (list 0 2 3.2 5 7 9 10))))
          (Pan2 (Saw ar (MIDICPS (DegreeToKey b (Add n o) 12))) p a)))
       (o4
        (Mul (RLPF (LFPulse ar (MIDICPS (mce2 36 43)) 0.15 0.5)
                   (MIDICPS (MulAdd (SinOsc kr 0.1 0) 10 36))
                   0.1)
             0.1)))
  (Sum4 o1 o2 o3 o4))
