; mridangam
(let*
 ((drum
   (lambda (a)
     (let ((n (Mul (WhiteNoise) 70))
           (e (Decay2 a 0.002 0.1)))
       (Mul (Distort (Mul (Resonz (Mul n e) (MidiCps 60) 0.02) 4)) 0.4))))
  (drone
   (let ((s1 (Saw (MidiCps (Mce2 60 60.04))))
         (s2 (Saw (MidiCps (Mce2 67 67.04)))))
     (Mul (LPF (Add s1 s2) (MidiCps 108)) 0.007)))
  (lseq (lambda (l n) (Dseq n (asMce l))))
  (lrand (lambda (l n) (Drand n (asMce (map (lambda (x) (lseq x 1)) l)))))
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
 (Add (drum (TDuty (Fdiv 1 8) 0 doNothing (Dseq 1 (asMce a-seq)) 0))
      drone))
