; PV_HainsworthFoote ; just hainsworth metric with low threshold
(let* ((source (sound-in 0))
       (detect (PV_HainsworthFoote (fft* (LocalBuf 1 2048) source)
                                    1.0
                                    0.0
                                    (MouseX kr 0.5 1.25 1 0.1)
                                    0.04)))
  (mul3 (SinOsc ar (mce2 440 445) 0)
        (Decay (Mul 0.1 detect) 0.1)
        0.1))
