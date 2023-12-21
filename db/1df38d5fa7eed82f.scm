; noise burst Sweep (jmcc) #6
(let* ((lfoRate (MouseX 10 60 1 0.2))
       (amp (Max 0 (LfSaw lfoRate -1)))
       (cfreq (MouseY 400 8000 1 0.2))
       (freq (MulAdd (SinOsc 0.2 0) cfreq (Mul 1.05 cfreq))))
  (Resonz (Mul (WhiteNoiseN 2) amp) freq 0.1))
