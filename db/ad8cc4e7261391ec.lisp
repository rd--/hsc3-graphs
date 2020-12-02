; buf-comb-c ; local-buf does not need clearing, the delay line is filled by the ugen
(let* ((d (clone 2 (lambda () (dust ar 1))))
       (n (white-noise ar))
       (z (mul (decay d 0.3) n))
       (l (x-line kr 0.0001 0.01 20 do-nothing))
       (b (clone 2 (lambda () (local-buf 2 sample-rate)))))
  (mul (buf-comb-c b z l 0.2) 0.2))
