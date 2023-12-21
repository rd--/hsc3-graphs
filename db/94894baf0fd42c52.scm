; 20061024 (rd) ; requires=buf
(let*
  ((b (ctl "buf" 0))
   (x (MouseX 1 12 0 0.1))
   (l (LorenzL
               (SampleRate)
               (MulAdd (LfNoise0 x) 2 12)
               (MulAdd (LfNoise0 x) 20 38)
               (MulAdd (LfNoise0 x) 1.5 3)
               (Mce2 0.025 0.05)
               0.1 0.0 0.0))
   (p (Phasor
              0
              (Mul3 l 24 (BufRateScale b))
              0
              (BufFrames b) 0)))
  (BufRd 1 b p 0 2))
