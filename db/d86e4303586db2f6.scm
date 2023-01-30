; PV_HainsworthFoote ; just hainsworth metric with low threshold
(let* ((source (SoundIn 0))
       (detect (PV_HainsworthFoote
                (FftDefaults (LocalBuf 1 2048) source)
                1.0
                0.0
                (MouseX 0.5 1.25 1 0.1)
                0.04)))
  (Mul3
   (SinOsc (list 440 445) 0)
   (Decay (Mul 0.1 detect) 0.1)
   0.1))
