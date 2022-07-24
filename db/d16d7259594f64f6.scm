; lfo modulation (jmcc) #1 ; requires kr if FSinOsc
(let* ((o (MulAdd (FSinOsc 0.05 0) 80 160))
       (p (MulAdd (FSinOsc (Mce2 0.6 0.7) 0) 3600 4000))
       (s (RLPF (Mul (LFPulse (kr o) 0 0.4) 0.05) (kr p) 0.2)))
  (CombL s 0.3 (Mce2 0.2 0.25) 2))
