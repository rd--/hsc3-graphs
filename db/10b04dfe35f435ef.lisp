; mridangam
(let*
 ((drum
   (lambda (a)
     (let ((n (mul (white-noise ar) 70))
           (e (decay2 a 0.002 0.1)))
       (mul (distort (mul (resonz (mul n e) (midi-cps 60) 0.02) 4)) 0.4))))
  (drone
   (let ((s1 (saw ar (midi-cps (mce2 60 60.04))))
         (s2 (saw ar (midi-cps (mce2 67 67.04)))))
     (mul (lpf (add s1 s2) (midi-cps 108)) 0.007)))
  (lseq (lambda (l n) (dseq n (make-mce l))))
  (lrand (lambda (l n) (drand n (make-mce (map (lambda (x) (lseq x 1)) l)))))
  (a-solo
   (lrand
    (list
     (list 0.9 0.0 0.0 0.7 0.0 0.2 0.0 0.7 0.0 0.0)
     (list 0.9 0.2 0.0 0.7 0.0 0.2 0.0 0.7 0.0 0.0)
     (list 0.9 0.0 0.0 0.7 0.0 0.2 0.0 0.7 0.0 0.2)
     (list 0.9 0.0 0.0 0.7 0.2 0.2 0.0 0.7 0.0 0.0)
     (list 0.9 0.0 0.0 0.7 0.0 0.2 0.2 0.7 0.2 0.0)
     (list 0.9 0.2 0.2 0.7 0.2 0.2 0.2 0.7 0.2 0.2)
     (list 0.9 0.2 0.2 0.7 0.2 0.2 0.2 0.7 0.0 0.0)
     (list 0.9 0.0 0.0 0.7 0.2 0.2 0.2 0.7 0.0 0.0)
     (list 0.9 0.0 0.4 0.0 0.4 0.0 0.4 0.0 0.4 0.0)
     (list 0.9 0.0 0.0 0.4 0.0 0.0 0.4 0.2 0.4 0.2)
     (list 0.9 0.0 0.2 0.7 0.0 0.2 0.0 0.7 0.0 0.0)
     (list 0.9 0.0 0.0 0.7 0.0 0.0 0.0 0.7 0.0 0.0)
     (list 0.9 0.7 0.7 0.0 0.0 0.2 0.2 0.2 0.0 0.0)
     (list 0.9 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0))
    30))
  (a-seq
   (list
    (lseq (list 0.0) 10)
    (lseq (list 0.9 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0) 2)
    (lseq (list 0.9 0.0 0.0 0.2 0.0 0.0 0.0 0.2 0.0 0.0) 2)
    (lseq (list 0.9 0.0 0.0 0.2 0.0 0.2 0.0 0.2 0.0 0.0) 2)
    (lseq (list 0.9 0.0 0.0 0.2 0.0 0.0 0.0 0.2 0.0 0.2) 2)
    a-solo
    (lseq (list 2.0 0.0 0.2 0.5 0.0 0.2 0.9 1.5 0.0 0.2 0.5 0.0 0.2 0.9 1.5 0.0 0.2 0.5 0.0 0.2) 3)
    (lseq (list 5.0) 1))))
 (add (drum (t-duty ar (f-div 1 8) 0 do-nothing (dseq 1 (make-mce a-seq)) 0))
      drone))
