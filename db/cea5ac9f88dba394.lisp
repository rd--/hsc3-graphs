; tgrains
(let* ((b (ctl kr "buf" 0))
       (trate (MouseY kr 2 120 1 0.1))
       (dur (FDiv 1.2 trate))
       (clk (Impulse ar trate 0))
       (pos (MouseX kr 0 (BufDur kr b) 0 0.1))
       (pan (Mul (WhiteNoise kr) 0.6))
       (rate (ShiftLeft 1.2 (Round (Mul (WhiteNoise kr) 3) 1))))
  (TGrains 2 clk b rate pos dur pan 0.1 2))
