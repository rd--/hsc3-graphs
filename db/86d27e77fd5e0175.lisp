; t-grains
(let* ((b (ctl kr "buf" 0))
       (trate (mouse-y kr 2 120 1 0.1))
       (dur (f-div 1.2 trate))
       (clk (impulse ar trate 0))
       (pos (mouse-x kr 0 (buf-dur kr b) 0 0.1))
       (pan (mul (white-noise kr) 0.6))
       (rate (shift-left 1.2 (u:round (mul (white-noise kr) 3) 1))))
  (t-grains 2 clk b rate pos dur pan 0.1 2))
