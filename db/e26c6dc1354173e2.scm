; https://sccode.org/1-590 (dm)
(let* ((shift_register_f
        (lambda (n tr x)
          (let ((buf (LocalBuf 1 n))
                (count (PulseCount tr 0)))
            (mrg2
             (Demand tr 0 (mce-reverse (Dbufrd buf (make-mce (map (lambda (i) (Add i count)) (enumFromTo 1 n))) 1)))
             (Demand tr 0 (Dbufwr buf count x 1))))))
       (amp 0.1)
       (ip (Impulse kr (FDiv 1 16) 0))
       (rt (t-choose ip (make-mce (list 3 5 10))))
       (trs (t-choose ip (make-mce (list 0 2 -2 7 -5))))
       (tr1 (Trig1 (CuspL ar (Mul rt 3) 1 1.9 0.0) 0.001))
       (tr4 (PulseDivider tr1 4 0))
       (oct (Demand tr4 0 (Drand dinf (make-mce (list 12 -12)))))
       (note (Demand tr1 0 (Add (Dseq dinf (make-mce (map (lambda (i) (Add i trs)) (list 42 46 51 54 59 63 66)))) oct)))
       (chord (shift_register_f 5 tr1 (MIDICPS note)))
       (sig (pm-osc
             ar
             (Vibrato ar (K2A chord) 6 0.02 0 0 0.04 0.1 0.0 0.0)
             (Mul (Add 1.01 (LFPulse kr (FDiv 1 8) 0 0.5)) chord)
             (EnvGen kr tr1 1 0 1 do-nothing (env (list 3 3 0) (list 0 0.2) (list -4 -4) -1 -1))
             0))
       (cmp (mix (Mul (Mul sig (AmpCompA kr chord 0 0.32 1)) amp))))
  (XFade2
   (mce2 cmp cmp)
   (GVerb (BPF cmp (MIDICPS 90) 1) 50 8 0.5 0.5 15 0 0.7 0.5 300) 0.2 1))
