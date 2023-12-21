; lfo modulation (jmcc) #1
(let* ((o (Add (Mul (SinOsc 0.05 0) 80) 160))
       (p (Add (Mul (SinOsc (Mce2 0.6 0.7) 0) 3600) 4000))
       (s (Rlpf (Mul (LfPulse o 0 0.4) 0.05) p 0.2)))
  (CombL s 0.3 (Mce2 0.2 0.25) 2))
