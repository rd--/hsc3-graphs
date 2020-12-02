; ringz ; modulate ring time
(ringz (mul (impulse ar 6 0) 0.1)
       2000
       (x-line kr 4 0.04 8 do-nothing))
