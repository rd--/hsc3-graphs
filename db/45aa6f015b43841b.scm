; TGrains
(let* ((b (ctl "buf" 0))
       (trate (MouseY 2 120 1 0.1))
       (dur (Div 1.2 trate))
       (clk (Impulse trate 0))
       (pos (MouseX 0 (BufDur b) 0 0.1))
       (pan (Mul (WhiteNoise) 0.6))
       (rate (ShiftLeft 1.2 (RoundTo (Mul (WhiteNoise) 3) 1))))
  (TGrains 2 clk b rate pos dur pan 0.1 2))
