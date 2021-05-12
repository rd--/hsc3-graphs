; noise burst Sweep (jmcc) #6
(let* ((n (clone 2 (lambda () (WhiteNoise ar))))
       (lfo-rate (MouseX kr 10 60 1 0.2))
       (amp (Max 0 (LFSaw kr lfo-rate -1)))
       (cfreq (MouseY kr 400 8000 1 0.2))
       (freq (MulAdd (SinOsc kr 0.2 0) cfreq (Mul 1.05 cfreq))))
  (Resonz (Mul n amp) freq 0.1))
