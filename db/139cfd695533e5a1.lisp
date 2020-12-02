; ringz ; modulate frequency
(ringz (mul (white-noise ar) 0.005)
       (x-line kr 100 3000 10 do-nothing)
       0.5)
