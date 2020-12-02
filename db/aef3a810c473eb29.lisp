; ringz ; modulate frequency
(ringz (mul (impulse ar 6 0) 0.1)
       (x-line kr 100 3000 10 do-nothing)
       0.5)
