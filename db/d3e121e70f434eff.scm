; https://sccode.org/1-590 (dm)
(let* ((shiftRegister
        (lambda (n tr x)
          (let ((buf (LocalBuf 1 n))
                (count (PulseCount tr 0)))
            (Mrg2
             (Demand tr 0 (mceReverse (Dbufrd buf (asMce (map (lambda (i) (Add i count)) (enumFromTo 1 n))) 1)))
             (Demand tr 0 (Dbufwr buf count x 1))))))
       (amp 0.1)
       (ip (Impulse kr (FDiv 1 16) 0))
       (rt (TChoose ip (Mce3 3 5 10)))
       (trs (TChoose ip (Mce5 0 2 -2 7 -5)))
       (tr1 (Trig1 (CuspL ar (Mul rt 3) 1 1.9 0.0) 0.001))
       (tr4 (PulseDivider tr1 4 0))
       (oct (Demand tr4 0 (Drand dinf (Mce2 12 -12))))
       (note (Demand tr1 0 (Add (Dseq dinf (asMce (map (lambda (i) (Add i trs)) (list 42 46 51 54 59 63 66)))) oct)))
       (chord (shiftRegister 5 tr1 (MIDICPS note)))
       (sig (PMOsc
             ar
             (Vibrato ar (K2A chord) 6 0.02 0 0 0.04 0.1 0.0 0.0)
             (Mul (Add 1.01 (LFPulse kr (FDiv 1 8) 0 0.5)) chord)
             (EnvGen kr tr1 1 0 1 doNothing (env (list 3 3 0) (list 0 0.2) (list -4 -4) -1 -1))
             0))
       (cmp (Mix (Mul (Mul sig (AmpCompA kr chord 0 0.32 1)) amp))))
  (XFade2
   (Mce2 cmp cmp)
   (GVerb (BPF cmp (MIDICPS 90) 1) 50 8 0.5 0.5 15 0 0.7 0.5 300) 0.2 1))
