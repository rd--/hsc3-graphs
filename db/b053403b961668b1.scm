; sosc-lp (rd) ; controls image synthesiser, ie. send-trig ; kr
(let* ((dustR
        (lambda (lo hi)
          (let ((d (Dseq dinf (list (Dwhite 1 lo hi)))))
            (kr: (TDuty d 0 0 (Abs (WhiteNoise)) 1)))))
       (b0 (asLocalBuf (list 60 71 89 65 36 57 92 97 92 97)))
       (b1 (asLocalBuf (list 71 89 60 57 65 36 95 92 93 97)))
       ;(b0 (asLocalBuf (list 71 60 65 89 36 57 95 97 92 97)))
       ;(b1 (asLocalBuf (list 89 71 60 65 57 36 92 95 93 97)))
       (clk (dustR 0.2 0.9))
       (env (Decay2 clk 0.002 2.5))
       (idx (Stepper clk 0 0 15 1 0))
       (f1 (kr: (MidiCps (list (Sub (BufRd 1 b0 idx 1 1) 24) (Sub (BufRd 1 b1 idx 1 1) 24)))))
       (f2 (kr: (Add f1 (Mul (LFNoise0 (list 1 3)) 1.2))))
       (o1 (Mul (SinOsc f1 0) env))
       (o2 (Mul (SinOsc f2 0) env)))
  (Mrg2
   (Mul (Add o1 o2) 0.2)
   (SendTrig clk 0 clk)))
