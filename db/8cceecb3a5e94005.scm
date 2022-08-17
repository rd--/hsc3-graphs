; landon-rose (jmcc)
(let*
    ((nt
      (list
       (list 32 43 54 89)
       (list 10 34 80 120)
       (list 67 88 90 100)
       (list 76 88 99 124)))
     (fr
      (map (lambda (x) (map midiCps x)) nt))
     (nd
      (lambda (e f)
        (let ((x (Mul (Mul e (PinkNoise)) (List 0.0011 0.0012))))
          (RingzBank x f (List 1) (List 3)))))
     (env
      (lambda (i) (Abs (SinOsc 1/8 (Mul (/ i 2) pi))))))
  (Mix (map nd (map env (enumFromTo 0 3)) fr)))
