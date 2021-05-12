; tgrains
(let* ((b (ctl kr "buf" 0))
       (trate (MouseY kr 8 120 1 0.1))
       (dur (FDiv 4 trate))
       (clk (Dust ar trate))
       (x (MouseX kr 0 (BufDur kr b) 0 0.1))
       (pos (Add x (TRand 0 0.01 clk)))
       (pan (Mul (WhiteNoise kr) 0.6)))
  (TGrains 2 clk b 1 pos dur pan 0.1 2))
