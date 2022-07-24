; Hypot
(let* ((x 10)
       (y (Mul (LFSaw 1/6 0) 100))
       (distance (Hypot x y))
       (amplitude (Fdiv 40 (Squared distance)))
       (sound (RLPF (Mul (FSinOsc 200 0) (LFPulse 31.3 0 0.4)) 400 0.3)))
  (Mul (DelayL sound 110/344 (Fdiv distance 344)) amplitude))
