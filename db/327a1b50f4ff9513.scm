; pm-crotale (dmc) #1.7 ; graph spawn texture variant ; infrequent
(let ((f (lambda (tr)
           (let* ((art (TRand 2 6 tr))
                  (freq (MidiCps (TIRand 48 72 tr)))
                  (env (EnvPerc 0 art 1 (list -4 -4)))
                  (mod (Add 5 (Fdiv 1 (TIRand 2 6 tr))))
                  (amp1 (EnvGen tr (TRand 0.1 0.3 tr) 0 art 0 env))
                  (amp2 (EnvGen tr (TRand 0.1 0.5 tr) 0 (Mul 1.3 art) 0 env))
                  (sig (PMOsc freq (Mul mod freq) (EnvGen tr (TRand 1 6 tr) 0 art 0 env) 0)))
             (Pan2 sig (TRand2 1 tr) (Mul amp1 amp2))))))
  (Splay (mceFill 5 (lambda (_) (f (Dust 0.05)))) 1 1 0 #t))