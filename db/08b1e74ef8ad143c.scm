; moto rev (jmcc) #1
(let* ((f (add (mul (sinosc 0.2 0) 10) 21))
       (s (lfpulse f '(0 0.1) 0.1)))
  (clip2 (rlpf s 100 0.1) 0.4))
