; spe (jmcc)
(let* ((rapf (lambda (i) (AllpassN i 0.05 (RandN 2 0 0.05) 4)))
       (n (LfNoise1 1))
       (s (list 00 03 02 07
                08 32 16 18
                00 12 24 32))
       (m (Dseq inf s))
       (t (Impulse 9 0))
       (f (MidiCps (Add (Demand t 0 m) 32)))
       (p (EnvPerc 0.01 1 1 (list -4 -4)))
       (e (EnvGen t 0.1 0 1 doNothing p))
       (o (Mul (LfSaw f 0) e))
       (rq (MidiCps (MulAdd n 36 110))))
  (Mul (iter 4 rapf (Rlpf o rq 0.1)) 0.25))
