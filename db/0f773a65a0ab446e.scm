; 20060916 (rd)
(let* ((mk-read
	(lambda (l t)
	  (BufRd 1 (asLocalBuf l) (TRand 0 6 t) 0 1)))
       (mk-node
        (lambda (n)
          (let* ((t (Dust 1.6))
                 (f (MidiCps (mk-read (list 60 62 64 65 67 69) t)))
                 (p (mk-read (list -1 -0.5 0 0.25 0.75 1.0) t))
                 (a (mk-read (list 0.01 0.05 0.1 0.15 0.25 0.35) t)))
            (cons
	     (Pan2 (SinOsc f 0) p a)
             (SendTrig t n (Div f 660))))))
       (ns (map mk-node (to 1 4))))
  (Mrg
   (cons
    (Mul (Mix (map car ns)) 0.25)
    (map cdr ns))))
