; pv-jensen-andersen ; propsc=0.25 prophfe=0.25 prophfc=0.25 propsf=0.25 threshold=1.0 waittime=0.04
(let* ((source (sound-in 0))
       (detect (pv-jensen-andersen (fft* (local-buf 1 2048) source)
                                   0.25 0.25 0.25 0.25
                                   (mouse-x kr 0.01 1.0 1 0.1)
                                   0.04)))
  (mul (sin-osc ar (mce2 440 445) 0)
       (decay (mul 0.1 detect) 0.1)))
