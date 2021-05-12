; sprinkler (jmcc) #1
(let* ((f (muladd (lfpulse 0.09 0 0.16) 10 7))
       (t (mul (lfpulse f 0 0.25) 0.1)))
  (bpz2 (mul (whitenoise) (kr: t))))
