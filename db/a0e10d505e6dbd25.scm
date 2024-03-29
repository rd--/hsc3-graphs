; hh-808 (ryan brown, wabdo.com)
(let* ((time 250)
       (freqs (list 205.35 304.41 369.64 522.71 540.54 812.21))
       (pulse-env
        (let ((e (Env (list 1.0 0.6) (list time) (list -0.5) 0 0)))
          (EnvGen 1 1 0 (/ 1 1000) doNothing e)))
       (s (let ((f (map (lambda (x) (Mul x 4.09)) freqs)))
            (Mix (LfPulse f 0 0.5))))
       (f (list
           (lambda (a)
             (Add3
	      (Mul (Eq a 6.0) 0.6)
              (Mul (Eq a 2.0) 0.2)
              (Mul (Eq a 1.0) 0.9)))
           (lambda (a)
             (Add
	      (Mul a pulse-env)
              (Mul (Mix (LfPulse freqs 0 0.55)) 0.9)))
           (lambda (a)
             (Rlpf a 7000 0.6))
           (lambda (a)
             (Rhpf a 6800 1.5))
           (lambda (a)
             (Rhpf a 6800 1.5))
           (lambda (a)
             (Rhpf a 1200 1.5))
           (lambda (a)
             (Add a (FreeVerb a 0.33 0.5 0.5)))
           (lambda (a)
             (let* ((c (list 0 -0.5 0 -50))
                    (e (Env (list 0 1 0.4 0 0)
                            (list 2 time 50 500)
                            c
                            0 0)))
               (Mul a (EnvGen 1 1 0 (/ 1 1000) removeSynth e))))
           (lambda (a)
             (Mce2 a (DelayN a 0.005 0.005)))))
       (>>> (flip compose)))
  (Mul ((foldl1 >>> f) s) 2))
