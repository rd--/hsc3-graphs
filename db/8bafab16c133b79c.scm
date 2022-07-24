; noise burst Sweep (jmcc) #6
(let* ((n (mceFill 2 (lambda (_) (WhiteNoise))))
       (lfoRate (MouseX 10 60 1 0.2))
       (amp (Max 0 (LFSaw lfoRate -1)))
       (cfreq (MouseY 400 8000 1 0.2))
       (freq (MulAdd (SinOsc 0.2 0) cfreq (Mul 1.05 cfreq))))
  (Resonz (Mul n amp) freq 0.1))
