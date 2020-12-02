; t-grains
(let* ((b (ctl kr "buf" 0))
       (trate (mouse-y kr 8 120 1 0.1))
       (dur (f-div 4 trate))
       (clk (dust ar trate))
       (x (mouse-x kr 0 (buf-dur kr b) 0 0.1))
       (pos (add x (t-rand 0 0.01 clk)))
       (pan (mul (white-noise kr) 0.6)))
  (t-grains 2 clk b 1 pos dur pan 0.1 2))
