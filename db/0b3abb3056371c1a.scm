; down-sample (adc)
(let* ((f (LFNoise2 8))
       (nh (LFNoise2 3))
       (src (Blip (MulAdd f 200 300) (MulAdd nh 10 20)))
       (sr (MouseX 1000 (Mul (SampleRate) 0.1) 1 0.2)))
  (Mul (Latch src (Impulse sr 0)) 0.1))
