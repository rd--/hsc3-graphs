; lfo modulation (jmcc) #1
(let* ((o (muladd (fsinosc 0.05 0) 80 160))
       (p (muladd (fsinosc (mce2 0.6 0.7) 0) 3600 4000))
       (s (rlpf (mul (lfpulse (kr: o) 0 0.4) 0.05) (kr: p) 0.2)))
  (combl s 0.3 (mce2 0.2 0.25) 2))
