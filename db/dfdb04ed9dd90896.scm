; hypot
(let* ((x 10)
       (y (Mul (LFSaw kr 1/6 0) 100))
       (distance (Hypot x y))
       (amplitude (FDiv 40 (Squared distance)))
       (sound (RLPF (Mul (FSinOsc ar 200 0) (LFPulse ar 31.3 0 0.4)) 400 0.3)))
  (Mul (DelayL sound 110/344 (FDiv distance 344)) amplitude))
