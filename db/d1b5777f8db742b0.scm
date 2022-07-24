; PV_JensenAndersen ; propsc=0.25 prophfe=0.25 prophfc=0.25 propsf=0.25 threshold=1.0 waittime=0.04
(let* ((source (SoundIn 0))
       (detect (PV_JensenAndersen (fftDefaults (LocalBuf 1 2048) source)
                                   0.25 0.25 0.25 0.25
                                   (MouseX 0.01 1.0 1 0.1)
                                   0.04)))
  (Mul (SinOsc (Mce2 440 445) 0)
       (Decay (Mul 0.1 detect) 0.1)))
