; down-sample - adc
(let* ((f (lf-noise2 kr 8))
       (nh (lf-noise2 kr 3))
       (src (blip ar (mul-add f 200 300) (mul-add nh 10 20)))
       (sr (mouse-x kr 1000 (mul sample-rate 0.1) 1 0.2)))
  (mul (latch src (impulse ar sr 0)) 0.1))
