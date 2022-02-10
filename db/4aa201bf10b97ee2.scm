; stepper
(letrec
    ((b (asLocalBuf 1 (list 97.999 195.998 523.251 466.164 195.998
                          233.082 87.307 391.995 87.307 261.626
                          195.998 77.782 233.082 195.998 97.999
                          155.563)))
     (seq (lambda (s l) (if (null? l) s (seq ((car l) s) (cdr l)))))
     (rate (MouseX kr 1 5 1 0.1))
     (clock (Impulse kr rate 0))
     (env (Decay2 clock 0.002 2.5))
     (Index (Stepper clock 0 0 15 1 0))
     (freq (BufRd 1 kr b Index 1 1))
     (ffreq (Add (if #t
                     (Lag2 freq 0.1)
                     (Mul (MouseY kr 80 1600 1 0.1) (Add (Mul env 4) 2)))
                 (Mce2 0 0.3)))
     (lfo (SinOsc kr 0.2 (Mce4 0 (/ pi 2) 0.0024 0.0025)))
     (rvb (lambda (s) (AllpassN s
                                 0.05
                                 (RandN 2 0 0.05)
                                 (Rand 1.5 2.0))))
     (proc (list
            (lambda (s) (Mul (RLPF s ffreq 0.3) env))
            (lambda (s) (Mul (RLPF s ffreq 0.3) env))
            (lambda (s) (Mul s 0.2))
            (lambda (s) (MulAdd (CombL s 1 (FDiv 0.66 rate) 2) 0.8 s)) ; echo
            (lambda (s) (Add s (Mul (seq s (replicate 5 rvb)) 0.3))) ; reverb
            (lambda (s) (LeakDC s 0.1))
            (lambda (s) (Add (DelayL s 0.1 lfo) s)) ; flanger
            (lambda (s) (OnePole s 0.9)))) ; slight bass emphasis
     (init (Mix (LFPulse ar (Mul freq (Mce3 1 3/2 2)) 0 0.3))))
  (seq init proc))
