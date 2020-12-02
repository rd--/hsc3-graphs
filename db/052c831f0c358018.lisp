; pv-hainsworth-foote ; just hainsworth metric with low threshold
(let* ((source (sound-in 0))
       (detect (pv-hainsworth-foote (fft* (local-buf 1 2048) source)
                                    1.0
                                    0.0
                                    (mouse-x kr 0.5 1.25 1 0.1)
                                    0.04)))
  (mul3 (sin-osc ar (mce2 440 445) 0)
        (decay (mul 0.1 detect) 0.1)
        0.1))
