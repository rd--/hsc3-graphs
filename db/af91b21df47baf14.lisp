; hh-808 (ryan brown, wabdo.com)
(let* ((time 250)
       (freqs (list 205.35 304.41 369.64 522.71 540.54 812.21))
       (pulse-env
        (let ((e (env (list 1.0 0.6) (list time) (list -0.5) 0 0)))
          (env-gen ar 1 1 0 (/ 1 1000) do-nothing e)))
       (s (let ((f (make-mce (map (lambda (x) (mul x 4.09)) freqs))))
            (mix (lf-pulse ar f 0 0.5))))
       (f (list
           (lambda (a)
             (sum3 (mul (eq a 6.0) 0.6)
                   (mul (eq a 2.0) 0.2)
                   (mul (eq a 1.0) 0.9)))
           (lambda (a)
             (add (mul a pulse-env)
                  (mul (mix (lf-pulse ar (make-mce freqs) 0 0.55)) 0.9)))
           (lambda (a)
             (rlpf a 7000 0.6))
           (lambda (a)
             (rhpf a 6800 1.5))
           (lambda (a)
             (rhpf a 6800 1.5))
           (lambda (a)
             (rhpf a 1200 1.5))
           (lambda (a)
             (add a (free-verb a 0.33 0.5 0.5)))
           (lambda (a)
             (let* ((c (list 0 -0.5 0 -50))
                    (e (env (list 0 1 0.4 0 0)
                            (list 2 time 50 500)
                            c
                            0 0)))
               (mul a (env-gen ar 1 1 0 (/ 1 1000) remove-synth e))))
           (lambda (a)
             (mce2 a (delay-n a 0.005 0.005)))))
       (>>> (flip compose)))
  (mul ((foldl1 >>> f) s) 2))
