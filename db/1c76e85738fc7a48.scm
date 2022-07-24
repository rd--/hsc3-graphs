; moto rev (jmcc) #1
(let ((f 'undefined) (s 'undefined))
  (set! f (Add (Mul (SinOsc 0.2 0) 10) 21))
  (set! s (LFPulse f (list 0 0.1) 0.1))
  (Clip2 (RLPF s 100 0.1) 0.4))
