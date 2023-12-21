; lg-timed (rd)
(let*
    ((timed
      (lambda (r y p)
	(let* ((d0 (Dser r p))
               (d1 (Dcons 0 d0))
               (d2 (Dser r y))
               (t (TDuty d1 0 removeSynth d2 1)))
          (Latch t t))))
     (lg (lambda (u) (Lag u 0.03)))
     (n (Mce6 52 76 66 67 68 69))
     (a (Mce6 0.35 0.15 0.04 0.05 0.16 0.07))
     (d (Mce6 0.1 0.5 0.09 0.08 0.07 0.3))
     (x (MouseX 0.5 1.25 linear 0.2))
     (tn (lg (timed inf n (Mul d x))))
     (ta (lg (timed inf a (Mul d x)))))
  (Mul (SinOsc (MidiCps tn) 0) ta))
