; stepper
(letrec
    ((b (as-local-buf (list 97.999 195.998 523.251 466.164 195.998
                            233.082 87.307 391.995 87.307 261.626
                            195.998 77.782 233.082 195.998 97.999
                            155.563)))
     (seq (lambda (s l) (if (null? l) s (seq ((car l) s) (cdr l)))))
     (rate (mouse-x kr 1 5 1 0.1))
     (clock (impulse kr rate 0))
     (env (decay2 clock 0.002 2.5))
     (index (stepper clock 0 0 15 1 0))
     (freq (buf-rd 1 kr b index 1 1))
     (ffreq (add (if #t
                     (lag2 freq 0.1)
                     (mul (mouse-y kr 80 1600 1 0.1) (add (mul env 4) 2)))
                 (mce2 0 0.3)))
     (lfo (sin-osc kr 0.2 (mce4 0 (/ pi 2) 0.0024 0.0025)))
     (rvb (lambda (s) (allpass-n s
                                 0.05
                                 (rand-n 2 0 0.05)
                                 (rand 1.5 2.0))))
     (proc (list
            (lambda (s) (mul (rlpf s ffreq 0.3) env))
            (lambda (s) (mul (rlpf s ffreq 0.3) env))
            (lambda (s) (mul s 0.2))
            (lambda (s) (mul-add (comb-l s 1 (f-div 0.66 rate) 2) 0.8 s)) ; echo
            (lambda (s) (add s (mul (seq s (replicate 5 rvb)) 0.3))) ; reverb
            (lambda (s) (leak-dc s 0.1))
            (lambda (s) (add (delay-l s 0.1 lfo) s)) ; flanger
            (lambda (s) (one-pole s 0.9)))) ; slight bass emphasis
     (init (mix (lf-pulse ar (mul freq (mce3 1 3/2 2)) 0 0.3))))
  (seq init proc))
