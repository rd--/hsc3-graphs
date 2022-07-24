; tgrains
(let* ((b (ctl "buf" 0))
       (trate (MouseY 8 120 1 0.1))
       (dur (Fdiv 12 trate))
       (clk (Impulse trate 0))
       (x (MouseX 0 (BufDur b) 0 0.1))
       (pos (Add x (TRand 0 0.01 clk)))
       (pan (Mul (WhiteNoise) 0.6)))
  (TGrains 2 clk b 1 pos dur pan 0.1 2))
