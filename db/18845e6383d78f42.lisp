; send-trig ; see /notify to receive
(let ((s (lf-noise0 kr 10)))
 (mrg2 (mul (sin-osc ar (mul-add s 200 500) 0) 0.1)
       (send-trig s 0 s)))
