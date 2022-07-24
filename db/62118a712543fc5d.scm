; hell is busy (jmcc) #1 ; texture=overlap,4,4,8,inf
(let* ((o (FSinOsc (Add 400 (Rand 0 2000)) 0))
       (a (Mul (LFPulse (Add 1 (Rand 0 10.0)) 0 (Rand 0 0.7)) 0.04)))
  (Pan2 (Mul o a) (Rand -1 1) 1))
