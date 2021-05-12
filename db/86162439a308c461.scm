; PV_JensenAndersen ; propsc=0.25 prophfe=0.25 prophfc=0.25 propsf=0.25 threshold=1.0 waittime=0.04
(let* ((source (sound-in 0))
       (detect (PV_JensenAndersen (fft* (LocalBuf 1 2048) source)
                                   0.25 0.25 0.25 0.25
                                   (MouseX kr 0.01 1.0 1 0.1)
                                   0.04)))
  (Mul (SinOsc ar (mce2 440 445) 0)
       (Decay (Mul 0.1 detect) 0.1)))
