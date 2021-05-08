; lz-bf (rd) ; requires=buf
(let*
  ((b (ctl kr "buf" 0))
   (x (MouseX kr 1 12 0 0.1))
   (l (LorenzL ar
               SampleRate
               (MulAdd (LFNoise0 kr x) 2 12)
               (MulAdd (LFNoise0 kr x) 20 38)
               (MulAdd (LFNoise0 kr x) 1.5 3)
               (mce2 0.025 0.05)
               0.1 0.0 0.0))
   (p (Phasor ar
              0
              (mul3 l 24 (BufRateScale kr b))
              0
              (BufFrames kr b) 0)))
  (BufRd 1 ar b p 0 2))
