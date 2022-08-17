; f0 <https://twitter.com/redFrik/status/1367808902457397250> ; translation error
(let* ((rat (list 76.1 76.1 64 57 38.1 85.4 32 114 42.7 47.9 95.9))
       (f (lambda (i)
            (let* ((f0 (Mul
			(listRef rat i)
			(Sub
			 (Add (Mul (Gt (SinOsc (/ 1 16) 0) 0) 2) 6)
                         (Fdiv (SinOsc (SinOsc (/ 1 32) i) 0) 20))))
                   (z (Fdiv (SinOsc f0 0) 9))
                   (x (VarLagEnv (Floor (Add (Mul (SinOsc (/ 1 64) 0) 6) 6)) 0.1 0 #f))
                   (y (VarLagEnv (Mul (SinOsc (Mul (Lt (SinOsc (/ 1 4) (Mul (/ i 11) pi)) 0) 2) 0) 0.1) 0.01 (SinOsc 0.01 i) #f))
                   (dly (Add (Add (Fdiv (Mod (Add i x) 11) 33) 0.1) y))
                   (dcy (Add (SinOsc (/ 1 9) 0) 1)))
              (CombC z 0.5 dly dcy)))))
  (Tanh (Splay (map f (enumFromTo 0 9)) 1 1 0 #t)))
