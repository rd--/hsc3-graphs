; sosc-lp (rd) ; controls image synthesiser, ie. send-trig...
(let* ((dustR
        (lambda (lo hi)
          (let ((d (Dseq dinf (asMce (list (Dwhite 1 lo hi))))))
            (TDuty d 0 0 (Abs (WhiteNoise)) 1))))
       (b0 (asLocalBuf 1 (list 60 71 89 65 36 57 92 97 92 97)))
       (b1 (asLocalBuf 1 (list 71 89 60 57 65 36 95 92 93 97)))
       ;(b0 (asLocalBuf 1 (list 71 60 65 89 36 57 95 97 92 97)))
       ;(b1 (asLocalBuf 1 (list 89 71 60 65 57 36 92 95 93 97)))
       (clk (dustR 0.2 0.9))
       (env (kr (Decay2 clk 0.002 2.5)))
       (idx (Stepper clk 0 0 15 1 0))
       (f1 (MidiCps (Mce2 (Sub (BufRd 1 b0 idx 1 1) 24) (Sub (BufRd 1 b1 idx 1 1) 24))))
       (f2 (Add f1 (Mul (LFNoise0 (Mce2 1 3)) 1.2)))
       (o1 (Mul (SinOsc (kr f1) 0) env))
       (o2 (Mul (SinOsc (kr f2) 0) env)))
  (Mrg2
   (Mul (Add o1 o2) 0.2)
   (kr (SendTrig clk 0 clk))))
